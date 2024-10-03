module Resolvers
  module LineItem
    class GetLineItems < Resolvers::BaseResolver
      type [ Types::LineItem::LineItemResponseType ], null: false

      def resolve
        user = context[:current_user]

        if user
          line_items = ::LineItem.joins(delivery_order: :order_group)
                                 .where(order_groups: { user_id: user.id })
          line_items
        else
          raise GraphQL::ExecutionError, "Authentication required"
        end
      end
    end
  end
end
