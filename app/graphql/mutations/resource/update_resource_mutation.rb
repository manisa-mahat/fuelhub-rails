module Mutations
  module Resource
    class UpdateResourceMutation < BaseMutation
      argument :id, ID, required: true
      argument :resource, Types::InputObjects::ResourceInputType, required: true

      field :resource, Types::Resource::ResourceType, null: true
      field :errors, [ String ], null: false

      def resolve(id:, resource:)
        service = Resources::ResourceService.new(params: resource.to_h.merge(id: id), current_user: context[:current_user])
        service.execute_update_resource

        {
          resource: service.success? ? service.resource : nil,
          errors: service.errors
        }
      end
    end
  end
end
