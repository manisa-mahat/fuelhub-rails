module Resolvers
  module ChildGroup
    class GetChildGroupsResolver < GraphQL::Schema::Resolver
      type [ Types::ChildGroup::ChildGroupType ], null: false

      def resolve
        ::ChildGroup.joins(:order_group)
                  .where(order_groups: { frequency: [ "daily", "weekly", "monthly", "bi-weekly" ] })
      end
    end
  end
end
