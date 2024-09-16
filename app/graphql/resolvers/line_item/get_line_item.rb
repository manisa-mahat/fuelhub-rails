module Resolvers
  module LineItem
    class GetLineItem < Resolvers::BaseResolver
      type Types::LineItem::LineItemResponseType, null: true

      argument :id, ID, required: true

      def resolve(id:)
        ::LineItem.find(id)
      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new("LineItem not found: #{e.message}")
      end
    end
  end
end
