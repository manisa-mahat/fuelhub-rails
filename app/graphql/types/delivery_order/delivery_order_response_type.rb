module Types
  module DeliveryOrder
    class DeliveryOrderResponseType < BaseObject
      field :delivery_order, Types::DeliveryOrder::DeliveryOrderType, null: true
      field :errors, [ String ], null: true
    end
  end
end
