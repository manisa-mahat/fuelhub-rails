module Resolvers
  module Outlets
    class OutletResolver < BaseResolver
      type Types::Outlet::OutletResponseType, null: true
      def resolve
        begin
          outlets = ConsumerOutlet.order(created_at: :DESC)
          {
            outlets: outlets,
            errors: []
          }
        rescue GraphQL::ExecutionError => error
          {
            outlets: nil,
            errors: [ error.message ]
          }
        end
      end
    end
  end
end
