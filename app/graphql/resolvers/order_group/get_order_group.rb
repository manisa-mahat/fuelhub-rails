module Resolvers
  module OrderGroup
    class GetOrderGroup < Resolvers::BaseResolver
      type [ Types::OrderGroup::OrderGroupResponseType ], null: true

      def resolve(id:)
       tenant_id = context[:current_user]&.tenant_id

        if tenant_id
          order_groups = ::OrderGroup.where(tenant_id: tenant_id, recurring: false)
          { order_groups: order_groups, errors: [] }
        else
          { order_groups: [], errors: [ "User is not logged in" ] }
        end
      rescue StandardError => e
        { order_groups: [], errors: [ e.message ] }
      end
    end
  end
end
