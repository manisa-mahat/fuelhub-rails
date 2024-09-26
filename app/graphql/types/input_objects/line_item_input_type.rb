module Types
  module InputObjects
    class LineItemInputType < BaseInputObject
      argument :id, ID, required: false
      argument :quantity, Integer, required: true
      argument :product_id, Integer, required: true
      argument :status, Types::Enums::LineItemEnum::LineItemStatusEnum, required: true
    end
  end
end
