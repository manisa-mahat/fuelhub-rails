module DeliveryOrder
  class DeliveryOrderService
    attr_reader :params, :user
    attr_accessor :delivery_order

    def initialize(params = {}, user:)
      @params = params
      @user = user
    end

    def create_delivery_order
      @delivery_order = DeliveryOrder.new(delivery_order_params)
      if @delivery_order.save
        success_response(@delivery_order)
      else
        error_response(@delivery_order.errors.full_messages)
      end
    end

    def update_delivery_order(id)
      @delivery_order = DeliveryOrder.find(id)
      if @delivery_order.update(delivery_order_params)
        success_response(@delivery_order)
      else
        error_response(@delivery_order.errors.full_messages)
      end
    end

    def delete_delivery_order(id)
      @delivery_order = DeliveryOrder.find(id)
      if @delivery_order.destroy
        success_response(@delivery_order)
      else
        error_response(@delivery_order.errors.full_messages)
      end
    end

    private

    def delivery_order_params
      params.require(:delivery_order).permit(
        :planned_at,
        :completed_at,
        :consumer_outlet_id,
        line_items_attributes: [
          :id,
          :product_id,
          :status,
          :quantity,
          :product,
          :_destroy
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
