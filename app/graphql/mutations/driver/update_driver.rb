module Mutations 
  module Driver
    class UpdateDriver < BaseMutation
      argument :id, ID, required: true
      argument :driver, Types::InputObjects::DriverInputType, required: true

      field :driver, Types::Driver::DriverType, null: true
      field :errors, [ String ], null: false

      def resolve(id:, driver:)
        service = Drivers::DriverServices.new(params: driver.to_h.merge(id: id), current_user: context[:current_user])
        service.execute_update_driver

        {
          driver: service.success? ? service.driver : nil,
          errors: service.errors
        }
      end
    end
  end
end
