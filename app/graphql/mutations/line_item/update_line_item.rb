module Mutations
  module LineItem
    class UpdateLineItem < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :line_item_input, Types::InputObjects::LineItemInputType, required: true

      field :line_item, Types::LineItem::LineItemType, null: true
      field :errors, [ String ], null: true

      def resolve(id:, line_item_input:)
        service = LineItem::LineItemService.new({ line_item: line_item_input.to_h }, user: context[:current_user])
        result = service.update_line_item(id)

        if result.success
          { line_item: result.line_item, errors: [] }
        else
          { line_item: nil, errors: result.errors }
        end
      end
    end
  end
end
