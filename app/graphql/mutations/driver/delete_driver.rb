module Mutations
  module Driver
    class DeleteDriver < BaseMutation
      argument :id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: false

      def resolve(id:)
        service = Drivers::DriverServices.new(params: { id: id }, current_user: context[:current_user])
        service.execute_delete_driver
        {
          success: service.success?,
          errors: service.errors
        }
      end
    end
  end
end
