module Mutations
  module OrderGroup
    class CreateOrderGroup < Mutations::BaseMutation
      argument :order_group_input, Types::InputObjects::OrderGroupInputType, required: true

      field :order_group, Types::OrderGroup::OrderGroupType, null: true
      field :errors, [ String ], null: true

      def resolve(order_group_input:)
        service = OrderGroups::OrderGroupService.new({ order_group: order_group_input.to_h }, user: context[:current_user])
        result = service.perform_create_order_group


        if result.success
          if order_group_input.recurring
            RecurringJob.perform_async(result.order_group.id)
          end
          { order_group: result.order_group, errors: [] }
        else
          { order_group: nil, errors: result.errors }
        end
      end
    end
  end
end
