module Types
  module InputObjects
    class LineItemInputType < BaseInputObject
      argument :name, String, required: true
      argument :quantity, Integer, required: true
      argument :units, String, required: true
      argument :status, Types::Enums::LineItemEnum::StatusEnum, required: true
    end
  end
end
