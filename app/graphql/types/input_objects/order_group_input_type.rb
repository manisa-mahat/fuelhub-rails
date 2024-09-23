module Types
  module InputObjects
    class OrderGroupInputType < BaseInputObject
      argument :status, Types::Enums::OrderGroupEnums::OrderGroupStatusEnum, required: true
      argument :planned_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :consumer_id, ID, required: true
      argument :delivery_order_attributes, Types::InputObjects::DeliveryOrderInputType, required: false
    end
  end
end
