module Resolvers
  module Tenant
    class TenantsResolver < BaseResolver
      type [ Types::Tenant::TenantType ], null: false

      def resolve
        ::Tenant.all
      end
    end
  end
end
