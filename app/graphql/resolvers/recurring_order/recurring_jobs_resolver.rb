module Resolvers
  module RecurringOrder
    class RecurringJobsResolver < GraphQL::Schema::Resolver
      type [ Types::OrderGroup::OrderGroupType ], null: false

      def resolve
        tenant_id = context[:current_user]&.tenant_id

        if tenant_id
          ::OrderGroup.where(tenant_id: tenant_id)
                                       .where.not(frequency: nil)
                                       .where(recurring: true)
        else
          raise GraphQL::ExecutionError, "User is not logged in or tenant_id is missing"
        end
      end
    end
  end
end
