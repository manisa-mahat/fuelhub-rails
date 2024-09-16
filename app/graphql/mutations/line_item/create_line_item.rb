module Mutations
  module LineItem
    class CreateLineItem < Mutations::BaseMutation
      argument :line_item_input, Types::InputObjects::LineItemInputType, required: true

      field :line_item, Types::LineItem::LineItemType, null: true
      field :errors, [ String ], null: true

      def resolve(line_item_input:)
        service = LineItem::LineItemService.new({ line_item: line_item_input.to_h }, user: context[:current_user])
        result = service.perform_create_line_item

        if result.success
          { line_item: result.line_item, errors: [] }
        else
          { line_item: nil, errors: result.errors }
        end
      end
    end
  end
end
