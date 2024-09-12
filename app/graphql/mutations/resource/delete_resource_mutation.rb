module Mutations
  module Resource
    class DeleteResourceMutation < BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: false

      def resolve(id:)
        service = Resources::ResourceService.new(params: { id: id }, current_user: context[:current_user])
        service.execute_delete_resource

        {
          success: service.success?,
          errors: service.errors
        }
      end
    end
  end
end
