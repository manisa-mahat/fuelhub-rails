module Types
  module LineItem
    class LineItemType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :quantity, Integer, null: false
      field :units, String, null: false
      field :status, Types::Enums::LineItemStatusEnum, null: false
    end
  end
end
