module Mutations
  module Outlet
    class CreateOutlet < BaseMutation
      argument :outlet_details, Types::Inputs::OutletInput, required: true

      field :outlet, Types::Outlet::ConsumerOutletType, null: false
      field :errors, [ String ], null: false

      def resolve(outlet_details: {})
        begin
          outlet_service = ::Outlets::ConsumerOutletService.new(outlet_details.to_h).create_consumer_outlet
          if outlet_service.success?
            {
              outlet: outlet_service.outlet,
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
