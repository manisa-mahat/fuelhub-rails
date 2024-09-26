module Types
  module DeliveryOrder
    class DeliveryOrderType < BaseObject
      field :id, ID, null: false
      field :planned_at, GraphQL::Types::ISO8601DateTime, null: true
      field :completed_at, GraphQL::Types::ISO8601DateTime, null: true
      field :consumer_outlet_id, ID, null: false
      field :line_items, [ Types::LineItem::LineItemType ], null: true
      field :consumer_outlet, Outlet::ConsumerOutletType, null: true
    end
  end
end
