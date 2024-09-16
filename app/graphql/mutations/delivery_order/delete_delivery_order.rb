module Mutations
  module DeliveryOrder
    class DeleteDeliveryOrder < Mutations::BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: true

      def resolve(id:)
        service = DeliveryOrder::DeliveryOrderService.new({}, user: context[:current_user])
        result = service.delete_delivery_order(id)

        {
          success: result.success,
          errors: result.errors
        }
      end
    end
  end
end
