module Resolvers
  module OrderGroup
    class GetOrderGroups < Resolvers::BaseResolver
      type [ Types::OrderGroup::OrderGroupResponseType ], null: true

      argument :status, Types::Enums::OrderGroupEnums::OrderGroupStatusEnum, required: false

      def resolve(status: nil)
        user = context[:current_user]
        tenant_id = user&.tenant_id
        user_id = user&.id

        if tenant_id && user_id
          order_groups = ::OrderGroup.where(tenant_id: tenant_id, user_id: user_id)
          order_groups = order_groups.where(status: status)

          Rails.logger.debug "Order Groups fetched: #{order_groups.count}"

          order_groups.map do |order_group|
            { order_group: order_group, errors: [] }
          end
        else
          raise GraphQL::ExecutionError, "User is not logged in or tenant_id is missing"
        end
      rescue ActiveRecord::RecordNotFound => e
        [ { order_group: nil, errors: [ "OrderGroup not found: #{e.message}" ] } ]
      end
    end
  end
end
