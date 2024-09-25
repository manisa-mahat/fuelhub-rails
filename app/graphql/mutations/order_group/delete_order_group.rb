module Mutations
  module OrderGroup
    class DeleteOrderGroup < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :recurring, Boolean, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: true

      def resolve(id:, recurring:)
        service = OrderGroups::OrderGroupService.new({}, user: context[:current_user])
        result = service.execute_delete_order_group(id, recurring)

        {
          success: result.success,
          errors: result.errors
        }
      end
    end
  end
end
