class RecurringJob
  include Sidekiq::Job
  sidekiq_options queue: "default"

  def perform(order_group_id)
    order_group = OrderGroup.find(order_group_id)

    if order_group.recurring && within_schedule_period?(order_group)
      new_order_params = build_new_order_params(order_group)
      service = OrderGroups::OrderGroupService.new(new_order_params, user: order_group.user)
      result = service.perform_create_order_group

      if result.success
        schedule_next_job(result.order_group)
      end
    end
  end

  private

  def within_schedule_period?(order_group)
    current_date = Time.current.to_date
    return false if order_group.start_date.present? && current_date < order_group.start_date
    return false if order_group.end_date.present? && current_date > order_group.end_date

    true
  end

  def build_new_order_params(order_group)
    {
      order_group: {
        status: order_group.status,
        planned_at: order_group.planned_at,
        consumer_id: order_group.consumer_id,
        recurring: order_group.recurring,
        frequency: order_group.frequency,
        start_date: order_group.start_date,
        end_date: order_group.end_date,
        delivery_order_attributes: order_group.delivery_order.attributes.except("id").merge(
          line_items_attributes: order_group.delivery_order.line_items.map(&:attributes).map { |attrs| attrs.except("id") }
        )
      }
    }
  end

  def schedule_next_job(order_group)
    next_date = case order_group.frequency
    when "daily"
      Time.current + 1.minutes
    when "weekly"
      Time.current + 1.week
    when "bi-weekly"
      Time.current + 2.weeks
    when "monthly"
      Time.current + 1.month
    else
      nil
    end

    if next_date && (!order_group.end_date || next_date.to_date <= order_group.end_date)
      RecurringJob.perform_in((next_date - Time.current).to_i, order_group.id)
    end
  end

  def calculate_delay(frequency)
    case frequency
    when "daily"
      1.day
    when "weekly"
      1.week
    when "bi-weekly"
      2.weeks
    when "monthly"
      1.month
    else
      raise ArgumentError, "Invalid frequency"
    end
  end
end
