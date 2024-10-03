module Resolvers
  module RecurringOrder
    class RecurringJobParentResolver < GraphQL::Schema::Resolver
      type [ Types::OrderGroup::OrderGroupType ], null: false

      def resolve
        tenant_id = context[:current_user]&.tenant_id

        if tenant_id
          ::OrderGroup.where(tenant_id: tenant_id)
                      .where(recurring: true)
                      .where(parent_order_id: nil)
                      .where.not(frequency: nil)
                      .where.not(start_date: nil)
                      .where.not(end_date: nil)
        else
          raise GraphQL::ExecutionError, "User is not logged in"
        end
      end
    end
  end
end
