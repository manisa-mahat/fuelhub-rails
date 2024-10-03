class RecurringJob
  include Sidekiq::Job
  sidekiq_options queue: "default"

  def perform(order_group_id)
    order_group = OrderGroup.find(order_group_id)
    return unless within_schedule_period?(order_group)

    ActiveRecord::Base.transaction do
      create_recurring_orders(order_group)
    end
  end

  private

  def within_schedule_period?(order_group)
    current_date = Time.current.to_date
    return false if order_group.start_date && current_date < order_group.start_date
    return false if order_group.end_date && current_date > order_group.end_date
    true
  end

  def create_recurring_orders(order_group)
    current_date = order_group.start_date

    while current_date <= order_group.end_date
      new_order_params = build_new_order_params(order_group, current_date)

      service = OrderGroups::OrderGroupService.new(new_order_params, user: order_group.user)
      result = service.perform_create_order_group

      if result.success
        Rails.logger.info("Created order #{result.order_group.id} for date #{current_date}")
        create_child_order(result.order_group, order_group)
        current_date = next_delivery_date(current_date, order_group.frequency)
      else
        Rails.logger.error("Failed to create order for date #{current_date}. Errors: #{result.errors}")
        raise ActiveRecord::Rollback
      end
    end
  end

  def build_new_order_params(order_group, delivery_date)
    {
      order_group: {
        status: order_group.status,
        planned_at: delivery_date,
        consumer_id: order_group.consumer_id,
        recurring: order_group.recurring,
        frequency: order_group.frequency,
        start_date: order_group.start_date,
        end_date: order_group.end_date,
        parent_order_id: order_group.id,
        delivery_order_attributes: order_group.delivery_order.attributes.except("id").merge(
          line_items_attributes: order_group.delivery_order.line_items.map { |line| line.attributes.except("id") }
        )
      }
    }
  end

  def create_child_order(new_order_group, parent_order_group)
    new_order_group.update!(parent_order_id: parent_order_group.id)
  end

  def next_delivery_date(current_date, frequency)
    case frequency
    when "daily" then current_date + 1.day
    when "weekly" then current_date + 1.week
    when "bi-weekly" then current_date + 2.weeks
    when "monthly" then current_date + 1.month
    else raise ArgumentError, "Invalid frequency"
    end
  end
end
