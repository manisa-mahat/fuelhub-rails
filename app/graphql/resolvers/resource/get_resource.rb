module Resolvers
  module Resource
    class GetResource < BaseResolver
      type Types::Resource::ResourceResponseType, null: false

      def resolve
        resources = Resource.all
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
