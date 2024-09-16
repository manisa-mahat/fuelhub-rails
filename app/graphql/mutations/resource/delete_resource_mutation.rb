module Mutations
  module Resource
    class DeleteResourceMutation < BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: false

      def resolve(id:)
        service = Resources::ResourceService.new({ id: id }.to_h.merge(current_user: context[:current_user]))
        result = service.execute_delete_resource

        {
          success: result.success,
          errors: result.errors
        }
      end
    end
  end
end
