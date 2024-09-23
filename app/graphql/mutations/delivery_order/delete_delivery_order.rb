module Mutations
  module DeliveryOrder
    class DeleteDeliveryOrder < Mutations::BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: true

      def resolve(id:)
        service = DeliveryOrders::DeliveryOrderService.new({ id: id }, user: context[:current_user])
        result = service.execute_delete_delivery_order

        {
          success: result.success,
          errors: result.errors
        }
      end
    end
  end
end
