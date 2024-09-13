module Types
  module LineItem
    class LineItemResponseType < BaseObject
      field :line_item, Types::LineItem::LineItemType, null: true
      field :errors, [ String ], null: true
    end
  end
end
