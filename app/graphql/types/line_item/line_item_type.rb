module Types
  module LineItem
    class LineItemType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :quantity, Integer, null: false
      field :unit, String, null: false
      field :status, Enums::LineItemEnum::LineItemStatusEnum, null: false
    end
  end
end
