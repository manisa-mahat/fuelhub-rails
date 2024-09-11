module Mutations
  module Outlet
    class DeleteOutlet < BaseMutation
      argument :id, ID, required: true

      field :outlet, Types::Outlet::ConsumerOutletType, null: false
      field :message, [ String ], null: false
      field :errors, [ String ], null: false

      def resolve(id: [])
        begin
          outlet_service = ::Outlets::ConsumerOutletService.new({ id: id }).delete_consumer_outlet
          if outlet_service.success?
            {
              outlet: outlet_service.outlet,
              message: "Deleted Successfully",
              errors: []
            }
          else
            {
              outlet: nil,
              errors: outlet_service.errors
            }
          end
        rescue GraphQL::ExecutionError=> err
          {
            outlet: nil,
            errors: [ err.message ]
          }
        end
      end
    end
  end
end
