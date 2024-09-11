module Types
  module Enums
    module DriversEnums
      class StatusEnum < BaseEnum
        ::Drivers::DriverStatusEnum::STATUS.each do |name, _value|
          value(name.to_s.upcase, name)
        end
      end
    end
  end
end
