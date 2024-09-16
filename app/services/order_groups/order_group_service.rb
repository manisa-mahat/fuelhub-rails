module OrderGroups
  class OrderGroupService
    attr_reader :params, :user
    attr_accessor :order_group

    def initialize(params, user:)
      @params = params
      @user = user
    end

    def perform_create_order_group
      create_order_group
    end

    def execute_delete_order_group
      delete_order_group
    end

    def execute_update_order_group
      update_order_group
    end

    private

    def create_order_group
      begin
      @order_group = OrderGroup.new(order_group_params.merge(user_id: @user.id))
      if @order_group.save!
        success_response(@order_group)
      else
        error_response(@order_group.errors.full_messages)
      end
      rescue ActiveRecord::RecordInvalid => e
      error_response([ e.message ])
      end
    end

    def update_order_group(id)
      find_order_group(id)

      if @order_group.update(order_group_params)
        success_response(@order_group)
      else
        error_response(@order_group.errors.full_messages)
      end
    end

    def delete_order_group(id)
      find_order_group(id)

      if @order_group.destroy
        success_response(@order_group)
      else
        error_response(@order_group.errors.full_messages)
      end
    end

    def current_user
      current_user ||= params[:current_user]
    end


    def find_order_group(id)
      @order_group = OrderGroup.find(id)
    end

    def order_group_params
      ActionController::Parameters.new(params)
        .require(:order_group)
        .permit(
          :status,
          :started_at,
          :completed_at,
          :consumer_id,
          :tenant_id,
          :user_id,
          delivery_order_attributes: [
            :planned_at,
            :completed_at,
            :consumer_outlet_id,
            line_items_attributes: [
              :id,
              :name,
              :quantity,
              :units,
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
  end
end
