module Mutations
  module Outlet
    class UpdateOutlet < BaseMutation
      argument :outlet_details, Types::Inputs::OutletInput, required: true
      argument :consumer_outlet_id, ID, required: true

      field :outlet, Types::Outlet::ConsumerOutletType, null: true
      field :errors, [ String ], null: false

      def resolve(outlet_details:, consumer_outlet_id:)
        params = outlet_details.to_h.merge(consumer_outlet_id: consumer_outlet_id)

        outlet_service = ::Outlets::ConsumerOutletService.new(params).update_consumer_outlet

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
