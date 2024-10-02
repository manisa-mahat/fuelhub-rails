module Mutations
  module Driver
    class UpdateDriver < BaseMutation
      argument :id, ID, required: true
      argument :driver, Types::InputObjects::DriverInputType, required: true

      field :driver, Types::Driver::DriverType, null: true
      field :errors, [ String ], null: false

      def resolve(id:, driver:)
        params = {
          id: id,
          driver: driver.to_h,
          current_user: context[:current_user]
        }
        service = Drivers::DriverServices.new(params)
        service.execute_update_driver
      end
    end
  end
end
