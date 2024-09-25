module Resolvers
  module OrderGroup
    class GetAllOrders < Resolvers::BaseResolver
      type Types::OrderGroup::OrderGroupResponseType, null: false

      def resolve
        tenant_id = context[:current_user]&.tenant_id
        if tenant_id
          order_groups = ::OrderGroup.where(tenant_id: tenant_id)
          { order_groups: order_groups, errors: [] }
        else
          raise GraphQL::ExecutionError, "User is not logged in or tenant_id is missing"
        end
      end
    end
  end
end
