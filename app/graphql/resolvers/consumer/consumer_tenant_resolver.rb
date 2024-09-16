module Resolvers
  module Consumer
    class ConsumersByTenantResolver < BaseResolver
      type [Types::Consumer::ConsumerType], null: false
      argument :tenant_id, ID, required: true

      def resolve(tenant_id:)
        ::Consumer.where(tenant_id: tenant_id)
      end
    end
  end
end
