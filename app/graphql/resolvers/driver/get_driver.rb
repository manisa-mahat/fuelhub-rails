module Resolvers
  module Driver
    class GetDriver < BaseResolver
      type Types::Driver::DriverResponseType, null: false

      def resolve
        begin
          drivers = Driver.all
          {
              drivers: drivers,
              errors: []
            }
        rescue StandardError => e
            {
              drivers: [],
              errors: [ e.message ]
            }
        end
      end
    end
  end
end
