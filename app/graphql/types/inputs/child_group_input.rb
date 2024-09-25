module Types
  module Inputs
    class ChildGroupInput < BaseInputObject
      argument :id, ID, required: false
      argument :status, String, required: true
      argument :planned_at, String, required: true
      argument :completed_at, String, required: true
      argument :consumer_id, ID, required: false
      argument :user_id, ID, required: false
      argument :tenant_id, ID, required: false
      argument :order_group_id, Integer, required: false
      argument :order_group, Types::OrderGroup::OrderGroupType, required: false
      argument :delivery_order, Types::DeliveryOrder::DeliveryOrderType, required: true
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end
