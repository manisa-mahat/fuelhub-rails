module Resolvers
  module OrderGroup
    class GetOrderGroup < Resolvers::BaseResolver
      type Types::OrderGroup::OrderGroupResponseType, null: true

      argument :id, ID, required: true

      def resolve(id:)
        order_group = ::OrderGroup.find(id)
        { order_group: order_group, errors: [] }
      rescue ActiveRecord::RecordNotFound => e
        { order_group: nil, errors: [ "OrderGroup not found: #{e.message}" ] }
      end
    end
  end
end
