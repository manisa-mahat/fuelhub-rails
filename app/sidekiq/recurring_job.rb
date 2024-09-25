class RecurringJob
  include Sidekiq::Job
  sidekiq_options queue: "default"

  def perform(order_group_id = nil)
    if order_group_id
      order_group = OrderGroup.find(order_group_id)
      current_time = DateTime.now
      order_group_start_date = DateTime.parse(order_group.start_date.to_s)
      order_group_end_date = DateTime.parse(order_group.end_date.to_s)

      if current_time.between?(order_group_start_date, order_group_end_date)
        create_child_group(order_group, current_time)
        schedule_next_job(order_group, current_time)
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
      # delivery_order_id: order_group.deliver_order_id
    }

    child_group = ChildGroup.create!(params)
    child_delivery_order = child_group.create_delivery_order!(delivery_order.attributes.except("id", "created_at", "updated_at"))

    delivery_order.line_items.each do |line_item|
      new_line_item_attributes = line_item.attributes.except("id", "created_at", "updated_at")
      child_delivery_order.line_items.create!(new_line_item_attributes)
    end
  end

  def schedule_next_job(order_group, current_time)
    next_occurrence = calculate_next_occurrence(current_time, order_group.frequency)

    if next_occurrence && next_occurrence["next_occurence_date"] < order_group.end_date
      RecurringJob.perform_in(next_occurrence["perform_in_time"], order_group.id)
    end
  end

  def calculate_next_occurrence(current_time, frequency)
    case frequency
    when "daily"
      { "next_occurence_date" => current_time + 1.day,  "perform_in_time" => 1.day }
    when "weekly"
      { "next_occurence_date" => current_time + 1.weeks,  "perform_in_time" => 1.weeks }
    when "bi-weekly"
     { "next_occurence_date" => current_time + 2.weeks,  "perform_in_time" => 2.weeks }
    when "monthly"
      { "next_occurence_date" => current_time + 1.months,  "perform_in_time" => 1.months }
    else
      raise ArgumentError, "Invalid frequency: #{frequency}"
    end
  end
end
