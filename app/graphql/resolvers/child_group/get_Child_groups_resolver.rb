module Resolvers
  module ChildGroup
    class GetChildGroupsResolver < GraphQL::Schema::Resolver
      type [ Types::ChildGroup::ChildGroupType ], null: false

      def resolve
        user = context[:current_user]
        tenant_id = user&.tenant_id

        if tenant_id
          ::ChildGroup.joins(:order_group)
                      .where(order_groups: { tenant_id: tenant_id })
                      .where(order_groups: { frequency: [ "daily", "weekly", "monthly", "bi-weekly" ] })
        else
          raise GraphQL::ExecutionError, "User is not logged in or tenant_id is missing"
        end
      end
    end
  end
end
