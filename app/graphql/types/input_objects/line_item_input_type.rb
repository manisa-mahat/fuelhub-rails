module Types
  module InputObjects
    class LineItemInputType < BaseInputObject
      argument :name, String, required: true
      argument :quantity, Integer, required: true
      argument :unit, String, required: true
      argument :status, Types::Enums::LineItemEnum::LineItemStatusEnum, required: true
    end
  end
end
