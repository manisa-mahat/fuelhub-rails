module Types
  module OrderGroup
    class OrderGroupType < BaseObject
      field :id, ID, null: false
      field :status, Types::Enums::OrderGroupEnums::OrderGroupStatusEnum, null: false
      field :planned_at, GraphQL::Types::ISO8601DateTime, null: true
      field :completed_at, GraphQL::Types::ISO8601DateTime, null: true
      field :consumer_id, ID, null: false
      field :delivery_order, Types::DeliveryOrder::DeliveryOrderType, null: true
      field :tenant_id, ID, null: true
      field :user_id, ID, null: true
    end
  end
end
