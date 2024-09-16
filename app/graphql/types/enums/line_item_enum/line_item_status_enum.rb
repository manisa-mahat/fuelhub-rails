module Types
  module Enums
    module LineItemEnum
      class LineItemStatusEnum < BaseEnum
        ::LineItems::StatusEnum::STATUS.each do |name, _value|
          value(name.to_s, name)
        end
      end
    end
  end
end
