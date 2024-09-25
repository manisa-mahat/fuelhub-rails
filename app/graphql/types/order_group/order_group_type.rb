module Types
  module OrderGroup
    class OrderGroupType < BaseObject
      field :id, ID, null: false
      field :status, Types::Enums::OrderGroupEnums::OrderGroupStatusEnum, null: false
      field :planned_at, GraphQL::Types::ISO8601DateTime, null: true
      field :completed_at, GraphQL::Types::ISO8601DateTime, null: true
      field :consumer_id, ID, null: true
      field :delivery_order, Types::DeliveryOrder::DeliveryOrderType, null: true
      field :tenant_id, ID, null: true
      field :user_id, ID, null: true
      field :order_group_id, Integer, null: true, method: :id
      field :recurring, Boolean, null: true
      field :frequency, String, null: true
      field :start_date, GraphQL::Types::ISO8601DateTime, null: true
      field :end_date, GraphQL::Types::ISO8601DateTime, null: true
      field :consumer, Types::Consumer::ConsumerType, null: true
    end
  end
end
