module Mutations
  module OrderGroup
    class DeleteOrderGroup < Mutations::BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: true

      def resolve(id:)
        service = OrderGroups::OrderGroupService.new({ id: id }, user: context[:current_user])
        result = service.execute_delete_order_group

        if result.success
          { success: true, errors: [] }
        else
          { success: false, errors: result.errors }
        end
      end
    end
  end
end
