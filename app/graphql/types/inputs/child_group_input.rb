module Types
  module Inputs
    class ChildGroupInput < BaseInputObject
      argument :id, ID, required: false
      argument :status, Types::Enums::OrderGroupEnums::OrderGroupStatusEnum, required: true
      argument :planned_at, GraphQL::Types::ISO8601DateTime, required: true
      argument :completed_at, GraphQL::Types::ISO8601DateTime, required: true
      argument :consumer_id, ID, required: false
      argument :user_id, ID, required: false
      argument :tenant_id, ID, required: false
      argument :order_group_id, Integer, required: false
      argument :order_group, [ Types::InputObjects::OrderGroupInputType ], required: false
      argument :delivery_order_attributes, Types::InputObjects::DeliveryOrderInputType, required: false
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end
