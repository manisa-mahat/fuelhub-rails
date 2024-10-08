module Resolvers
  module RecurringOrder
    class RecurringJobsResolver < GraphQL::Schema::Resolver
      type [ Types::OrderGroup::OrderGroupType ], null: false

      def resolve
        tenant_id = context[:current_user]&.tenant_id

        if tenant_id
          ::OrderGroup.where(tenant_id: tenant_id)
                                       .where.not(frequency: nil)
                                       .where.not(parent_order_id: nil)
                                       .where(recurring: true)
        else
          raise GraphQL::ExecutionError, "User is not logged in"
        end
      end
    end
  end
end
