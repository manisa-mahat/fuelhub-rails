module OrderGroups
  class OrderGroupService
    attr_reader :params, :user
    attr_accessor :order_group

    VALID_FREQUENCIES = %w[daily weekly bi-weekly monthly].freeze

    def initialize(params, user:)
      @params = params
      @user = user
    end

    def perform_create_order_group
      validate_frequency if order_group_params[:recurring]

      create_order_group.tap do |result|
        if result.success && @order_group&.recurring
          schedule_next_order_group
        end
      end
    end

    private

    def create_order_group
      return error_response([ "User not Authenticated." ]) if current_user.nil?

      if order_group_params[:recurring] && order_group_params[:frequency].blank?
        return error_response([ "Frequency must be provided for recurring orders." ])
      end

      @order_group = OrderGroup.new(order_group_params.merge(user_id: @user.id, tenant_id: current_user.tenant_id))

      save_order_group(@order_group)
    end

    def save_order_group(order_group)
      if order_group.save
        success_response(order_group)
      else
        error_response(order_group.errors.full_messages)
      end
    rescue ActiveRecord::RecordInvalid => e
      error_response([ e.message ])
    end

    def validate_frequency
      frequency = order_group_params[:frequency]
      unless VALID_FREQUENCIES.include?(frequency)
        raise ActiveRecord::RecordInvalid.new(@order_group), "Frequency must be one of: #{VALID_FREQUENCIES.join(', ')}"
      end
    end

    def schedule_next_order_group
      RecurringJob.perform_in(calculate_delay, @order_group.id)
    end

    def calculate_delay
      case @order_group.frequency
      when "daily"
        1.minutes
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

    def order_group_params
      ActionController::Parameters.new(params)
        .require(:order_group)
        .permit(
          :status,
          :planned_at,
          :completed_at,
          :consumer_id,
          :tenant_id,
          :user_id,
          :recurring,
          :frequency,
          :start_date,
          :end_date,
          delivery_order_attributes: [
            :planned_at,
            :completed_at,
            :consumer_outlet_id,
            line_items_attributes: [
              :id,
              :name,
              :quantity,
              :unit,
              :status
            ]
          ]
        )
    end

    def success_response(order_group)
      OpenStruct.new(success: true, order_group: order_group, errors: [])
    end

    def error_response(errors)
      OpenStruct.new(success: false, order_group: nil, errors: errors)
    end

    def current_user
      @user
    end
  end
end
