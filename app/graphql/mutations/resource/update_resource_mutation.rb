module Mutations
  module Resource
    class UpdateResourceMutation < BaseMutation
      argument :resource, Types::InputObjects::ResourceInputType, required: true

      field :resource, Types::Resource::ResourceType, null: true
      field :errors, [ String ], null: false

      def resolve(resource:)
        service = Resources::ResourceService.new(resource.to_h.merge(current_user: context[:current_user]))
        result = service.execute_update_resource

        {
          resource: result.success ? result.resource : nil,
          errors: result.errors
        }
      end
    end
  end
end
