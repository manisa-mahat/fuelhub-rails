module Resolvers
  module OrderGroup
    class GetOrderGroups < Resolvers::BaseResolver
      type [ Types::OrderGroup::OrderGroupResponseType ], null: true

      argument :status, Types::Enums::OrderGroupEnums::OrderGroupStatusEnum, required: false

      def resolve(status: nil)
        if status
          ::OrderGroup.where(status: status)
        else
          ::OrderGroup.all
        end
      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new("OrderGroup not found: #{e.message}")
      end
    end
  end
end
