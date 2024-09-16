module Resolvers
  module DeliveryOrder
    class GetDeliveryOrder < Resolvers::BaseResolver
      type Types::DeliveryOrder::DeliveryOrderResponseType, null: true

      argument :id, ID, required: true

      def resolve(id:)
        ::DeliveryOrder.find(id)
      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new("DeliveryOrder not found: #{e.message}")
      end
    end
  end
end
