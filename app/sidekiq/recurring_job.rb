class RecurringJob
  include Sidekiq::Job
  sidekiq_options queue: "default"

  def perform
    recurring_orders = OrderGroup.where(parent_id: nil).where(recurring: true)

    recurring_orders.each do |order_group|
      current_time = DateTime.now

      if current_time.between?(order_group.start_date, order_group.end_date)
        create_recurring_order(order_group)
        next_occurrence = calculate_next_occurrence(current_time, order_group.frequency)
        if next_occurrence && next_occurrence < order_group.end_date
          RecurringJob.set(wait_until: next_occurrence).perform_async
        end
      end
    end
  end

  private

  def create_recurring_order(order_group)
    current_time = DateTime.now
    next_occurrence = calculate_next_occurrence(current_time, order_group.frequency)
    user = order_group.user
    params = {
      order_group: {
        status: "pending",
        planned_at: next_occurrence,
        consumer_id: order_group.consumer_id,
        parent_id: order_group.id,
        delivery_order_attributes: order_group.delivery_order.attributes.except("id", "created_at", "updated_at"),
        line_items_attributes: order_group.delivery_order.line_items.map do |line_item|
          line_item.attributes.except("id", "created_at", "updated_at")
        end
      }
    }
    service = OrderGroups::OrderGroupService.new(params, user: user)
    response = service.perform_create_order_group

    if response.success?
      puts "Created recurring order group with ID: #{response.order_group.id}"
    else
      raise StandardError, "Error creating recurring order group: #{response.errors.join(', ')}"
    end
  end

  def calculate_next_occurrence(current_time, frequency)
    case frequency
    when "daily"
      current_time + 1.day
    when "weekly"
      current_time + 1.week
    when "bi-weekly"
      current_time + 2.weeks
    when "monthly"
      current_time + 1.month
    else
      raise ArgumentError, "Invalid frequency: #{frequency}"
    end
  end
end
