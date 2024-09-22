module Resolvers
  module RecurringOrder
    class RecurringJobsResolver < GraphQL::Schema::Resolver
      type [ Types::OrderGroup::OrderGroupType ], null: false

      def resolve
        ::OrderGroup.where.not(frequency: nil).where(recurring: true)
      end
    end
  end
end
