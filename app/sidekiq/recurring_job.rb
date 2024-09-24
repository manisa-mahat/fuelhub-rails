class RecurringJob
  include Sidekiq::Job
  sidekiq_options queue: "default"

  def perform(order_group_id = nil)
    if order_group_id
      order_group = OrderGroup.find(order_group_id)
      current_time = DateTime.now

      if current_time.between?(order_group.start_date, order_group.end_date)
        create_child_group(order_group, current_time)
        schedule_next_job(order_group, current_time)
      end
    else
      recurring_orders = OrderGroup.where(recurring: true).where.not(frequency: nil)

      recurring_orders.each do |order_group|
        current_time = DateTime.now
        if current_time.between?(order_group.start_date, order_group.end_date)
          create_child_group(order_group, current_time)
          schedule_next_job(order_group, current_time)
        end
      end
    end
  end

  private

  def create_child_group(order_group, current_time)
    delivery_order = order_group.delivery_order

    params = {
      status: "pending",
      planned_at: current_time,
      completed_at: nil,
      consumer_id: order_group.consumer_id,
      user_id: order_group.user_id,
      tenant_id: order_group.tenant_id,
      order_group_id: order_group.id
    }

    child_group = ChildGroup.create!(params)

    child_delivery_order = child_group.create_delivery_order!(delivery_order.attributes.except("id", "created_at", "updated_at"))

    delivery_order.line_items.each do |line_item|
      new_line_item_attributes = line_item.attributes.except("id", "created_at", "updated_at", "delivery_order_id")
      child_delivery_order.line_items.create!(new_line_item_attributes)
    end
  end

  def schedule_next_job(order_group, current_time)
    next_occurrence = calculate_next_occurrence(current_time, order_group.frequency)

    if next_occurrence && next_occurrence < order_group.end_date
      delay_seconds = (next_occurrence - DateTime.now).to_i.seconds
      RecurringJob.perform_in(delay_seconds, order_group.id)
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
