module Resolvers
  module OrderGroup
    class GetOrderGroups < Resolvers::BaseResolver
      type [ Types::OrderGroup::OrderGroupResponseType ], null: true

      argument :status, Types::Enums::OrderGroupEnums::OrderGroupStatusEnum, required: false

      def resolve(status: nil)
        order_groups = status ? ::OrderGroup.where(status: status) : ::OrderGroup.all
        order_groups.map do |order_group|
          { order_group: order_group, errors: [] }
        end
      rescue ActiveRecord::RecordNotFound => e
        [ { order_group: nil, errors: [ "OrderGroup not found: #{e.message}" ] } ]
      end
    end
  end
end
