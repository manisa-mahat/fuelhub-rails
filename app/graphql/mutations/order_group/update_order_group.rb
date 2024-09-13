module Mutations
  module OrderGroup
    class UpdateOrderGroup < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :order_group_input, Types::InputObjects::OrderGroupInputType, required: true

      field :order_group, Types::OrderGroup::OrderGroupType, null: true
      field :errors, [ String ], null: true

      def resolve(id:, order_group_input:)
        service = OrderGroup::OrderGroupService.new({ order_group: order_group_input.to_h }, user: context[:current_user])
        result = service.update_order_group(id)

        if result.success
          { order_group: result.order_group, errors: [] }
        else
          { order_group: nil, errors: result.errors }
        end
      end
    end
  end
end
