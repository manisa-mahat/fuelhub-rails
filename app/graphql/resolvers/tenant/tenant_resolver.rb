module Resolvers
  module Tenant
    class TenantResolver < BaseResolver
      type Types::Tenant::TenantType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        ::Tenant.find(id)
      end
    end
  end
end
