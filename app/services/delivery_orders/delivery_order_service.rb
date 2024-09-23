module DeliveryOrders
  class DeliveryOrderService
    attr_reader :params, :user
    attr_accessor :delivery_order

    def initialize(params = {}, user:)
      @params = params
      @user = user
    end

    def execute_update_delivery_order
      update_delivery_order
    end

    def execute_delete_delivery_order
      delete_delivery_order
    end

    private

    def update_delivery_order
      @delivery_order = DeliveryOrder.find(params[:id])

      if @delivery_order.update(delivery_order_params)
        success_response(@delivery_order)
      else
        error_response(@delivery_order.errors.full_messages)
      end
    rescue ActiveRecord::RecordNotFound => e
      error_response([ e.message ])
    end

    def delete_delivery_order
      @delivery_order = DeliveryOrder.find(params[:id])
      if @delivery_order.destroy
        success_response(@delivery_order)
      else
        error_response(@delivery_order.errors.full_messages)
      end
    rescue ActiveRecord::RecordNotFound => e
      error_response([ e.message ])
    end

    def delivery_order_params
      ActionController::Parameters.new(params)
        .require(:delivery_order)
        .permit(
          :planned_at,
          :completed_at,
          :customer_outlet_id,
          line_items_attributes: [
            :name,
            :quantity,
            :unit,
            :status
          ]
        )
    end

    def success_response(delivery_order)
      OpenStruct.new(success: true, delivery_order: delivery_order, errors: [])
    end

    def error_response(errors)
      OpenStruct.new(success: false, delivery_order: nil, errors: errors)
    end
  end
end
