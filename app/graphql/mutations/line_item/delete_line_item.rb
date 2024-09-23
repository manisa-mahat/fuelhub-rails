module Mutations
  module LineItem
    class DeleteLineItem < Mutations::BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: true

      def resolve(id:)
        service = LineItems::LineItemService.new({}, user: context[:current_user])
        result = service.delete_line_item(id)

        {
          success: result.success,
          errors: result.errors
        }
      end
    end
  end
end
