module Mutations
  module OrderGroup
    class DeleteOrderGroup < Mutations::BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: true

      def resolve(id:)
        service = OrderGroup::OrderGroupService.new({}, user: context[:current_user])
        result = service.delete_order_group(id)

        {
          success: result.success,
          errors: result.errors
        }
      end
    end
  end
end
