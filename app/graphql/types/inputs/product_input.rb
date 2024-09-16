module Types
  module Inputs
    class ProductInput < BaseInputObject
      argument :id, ID, required: false
      argument :category, Types::Enums::ProductsEnums::CategoryEnum, required: true
      argument :name, String, required: true
      argument :status, Types::Enums::ProductsEnums::StatusEnum, required: true
      argument :unit, Types::Enums::ProductsEnums::UnitEnum, required: true
    end
  end
end
