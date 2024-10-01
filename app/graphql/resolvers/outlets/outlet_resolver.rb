module Resolvers
  module Outlets
    class OutletResolver < BaseResolver
      type Types::Outlet::OutletResponseType, null: true
      argument :id, ID, required: true

      def resolve(id:)
        current_user = context[:current_user]
        outlet_service = ::Outlets::ConsumerOutletService.new({ id: id, current_user: current_user }).execute_get_outlet
        if outlet_service.success?
          {
            consumer_outlets: outlet_service.outlets,
            errors: []
          }
        else
          {
            consumer_outlets: nil,
            errors: outlet_service.errors
          }
        end
      end
    end
  end
end
