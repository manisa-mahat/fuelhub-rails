# frozen_string_literal: true

module Types
  module Product
    class ProductType < Types::BaseObject
      field :id, ID, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :category, Enums::ProductsEnums::CategoryEnum
      field :name, String, null: false
      field :status, Enums::ProductsEnums::StatusEnum
      field :unit, Enums::ProductsEnums::UnitEnum
    end
  end
end
