module Resolvers
  module DeliveryOrder
    class GetDeliveryOrders < Resolvers::BaseResolver
      type [ Types::DeliveryOrder::DeliveryOrderResponseType ], null: true

      def resolve
        ::DeliveryOrder.all
      end
    end
  end
end
