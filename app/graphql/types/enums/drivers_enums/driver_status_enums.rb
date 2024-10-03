module Types
  module Enums
    module DriversEnums
      class DriverStatusEnums < BaseEnum
        ::Drivers::StatusEnum::STATUS.each do |name, _value|
          value(name.to_s, name)
        end
      end
    end
  end
end
