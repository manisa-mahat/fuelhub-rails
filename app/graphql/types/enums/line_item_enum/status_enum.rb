module Types
  module Enums
    module LineItemEnum
      class StatusEnum < BaseEnum
        ::LineItems::StatusEnum::STATUS.each do |name, _value|
          value(name.to_s.upcase, name)
        end
      end
    end
  end
end
