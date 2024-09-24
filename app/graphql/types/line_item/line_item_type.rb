module Types
  module LineItem
    class LineItemType < BaseObject
      field :id, ID, null: false
      field :quantity, Integer, null: false
      field :delivery_order_id, ID
      field :product_id, Integer, null: false
      field :status, Enums::LineItemEnum::LineItemStatusEnum, null: false
      field :product, Types::Product::ProductType, null: false
    end
  end
end
