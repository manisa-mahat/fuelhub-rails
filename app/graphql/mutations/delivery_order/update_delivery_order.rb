module Mutations
  module DeliveryOrder
    class UpdateDeliveryOrder < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :delivery_order_input, Types::InputObjects::DeliveryOrderInputType, required: true

      field :delivery_order, Types::DeliveryOrder::DeliveryOrderType, null: true
      field :errors, [ String ], null: true

      def resolve(id:, delivery_order_input:)
        service = DeliveryOrders::DeliveryOrderService.new({ id: id, delivery_order: delivery_order_input.to_h }, user: context[:current_user])
        result = service.execute_update_delivery_order

        if result.success
          { delivery_order: result.delivery_order, errors: [] }
        else
          { delivery_order: nil, errors: result.errors }
        end
      end
    end
  end
end
