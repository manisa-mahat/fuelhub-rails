module Types
  module ChildGroup
    class ChildGroupType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :status, String, null: true
      field :planned_at, String, null: true
      field :completed_at, String, null: true
      field :consumer_id, ID, null: false
      field :user_id, ID, null: false
      field :tenant_id, ID, null: false
      field :order_group_id, Integer, null: false
      field :order_group, Types::OrderGroup::OrderGroupType, null: false
      field :delivery_order, Types::DeliveryOrder::DeliveryOrderType, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
