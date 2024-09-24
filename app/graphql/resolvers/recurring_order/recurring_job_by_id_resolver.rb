module Resolvers
  module RecurringOrder
    class RecurringJobByIdResolver < GraphQL::Schema::Resolver
      type Types::OrderGroup::OrderGroupType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        order_group = ::OrderGroup.find_by(id: id)

        if order_group.nil?
          raise GraphQL::ExecutionError, "OrderGroup with id #{id} not found."
        end

        if order_group.recurring && order_group.frequency.present? && order_group.start_date.present? && order_group.end_date.present?
          order_group
        else
          raise GraphQL::ExecutionError, "OrderGroup with id #{id} is not a recurring job."
        end
      end
    end
  end
end
