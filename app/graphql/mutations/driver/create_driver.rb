module Mutations
  module Driver
    class CreateDriver < BaseMutation
      argument :driver_input, Types::InputObjects::DriverInputType, required: true

      field :driver, Types::Driver::DriverType, null: true
      field :errors, [ String ], null: true

      def resolve (driver_input = {})
        service = Drivers::DriverServices.new(driver_input.to_h.merge(current_user: context[:current_user]))
        result = service.execute_create_driver
          if result.success
            { driver: result.driver, errors: [] }
          else
            { driver: nil, errors: result.errors }
          end
      end
    end
  end
end
