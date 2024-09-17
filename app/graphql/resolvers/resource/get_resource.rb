module Resolvers
  module Resource
    class GetResource < BaseResolver
      type Types::Resource::ResourceResponseType, null: false

      def resolve
        current_user = context[:current_user]
        resources = ::Resource.where(tenant_id: current_user.tenant_id)

        {
          resources: resources,
          errors: []
        }
      rescue StandardError => e
        {
          resources: [],
          errors: [ e.message ]
        }
      end
    end
  end
end
