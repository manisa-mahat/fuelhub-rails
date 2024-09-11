module Mutations
  module Resource
    class CreateResourceMutation < Mutations::BaseMutation
      argument :resource_input, Types::InputObjects::ResourceInputType, required: true

      field :resource, Types::Resource::ResourceType, null: true
      field :errors, [ String ], null: true

      def resolve(resource_input: {})
      service = Resources::ResourceService.new(resource_input.to_h.merge(current_user: context[:current_user]))
      result = service.perform_create_resource
        # debugger
        # result = service.create_resource

        if result.success
          { resource: result.resource, errors: [] }
        else
          { resource: nil, errors: result.errors }
        end
      end
    end
  end
end
