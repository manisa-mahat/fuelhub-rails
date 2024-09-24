module Resolvers
  module LineItem
    class GetLineItems < Resolvers::BaseResolver
      type Types::LineItem::LineItemResponseType.connection_type, null: false

      # argument :status, Types::Enums::LineItemEnum::LineItemStatusEnum, required: false

      def resolve
        ::LineItem.all
      rescue StandardError => e
        GraphQL::ExecutionError.new("Failed to fetch line items: #{e.message}")
      end
    end
  end
end
