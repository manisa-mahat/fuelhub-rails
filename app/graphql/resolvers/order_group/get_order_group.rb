module Resolvers
  module OrderGroup
    class GetOrderGroup < Resolvers::BaseResolver
      type Types::OrderGroup::OrderGroupResponseType, null: true

      argument :id, ID, required: true

      def resolve(id:)
        ::OrderGroup.find(id)
      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new("OrderGroup not found: #{e.message}")
      end
    end
  end
end
