module Mutations
  module Outlet
    class UpdateOutlet < BaseMutation
      argument :outlet_details, Types::Inputs::OutletInput, required: true

      field :outlet, Types::Outlet::ConsumerOutletType, null: true
      field :message, String, null: false
      field :errors, [ String ], null: false

      def resolve(outlet_details: {})
        outlet_service = ::Outlets::ConsumerOutletService.new(outlet_details.to_h).update_consumer_outlet

        if outlet_service.success?
          {
            outlet: outlet_service.outlet,
            message: "Updated Successfully.",
            errors: []
          }
        else
          {
            outlet: nil,
            message: "Cannot Update.",
            errors: outlet_service.errors
          }
        end
      rescue ActiveRecord::RecordNotFound => e
        {
          outlet: nil,
          errors: [ "Outlet not found: #{e.message}" ]
        }
      rescue ActiveRecord::RecordInvalid => e
        {
          outlet: nil,
          errors: [ "Invalid outlet data: #{e.record.errors.full_messages.join(', ')}" ]
        }
      rescue StandardError => e
        {
          outlet: nil,
          errors: [ "Unexpected error: #{e.message}" ]
        }
      end
    end
  end
end
