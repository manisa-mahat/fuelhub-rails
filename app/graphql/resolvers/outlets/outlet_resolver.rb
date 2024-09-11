module Resolvers
  module Outlets
    class OutletResolver < BaseResolver
      type Types::Outlet::OutletResponseType, null: true

      def resolve
        begin
          outlets = ConsumerOutlet.order(created_at: :DESC)
          {
            consumer_outlets: outlets,
            errors: []
          }
        rescue GraphQL::ExecutionError => error
          {
            consumer_outlets: nil,
            errors: [ error.message ]
          }
        end
      end
    end
  end
end
