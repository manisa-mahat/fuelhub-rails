module Types
  module Driver
    class DriverResponseType < Types::BaseObject
      field :drivers, [ DriverType ], null: true
      field :errors, [ String ], null: true
    end
  end
end
