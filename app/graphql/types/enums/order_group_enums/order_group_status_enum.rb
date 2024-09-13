module Types
  module Enums
    module OrderGroupEnums
      class OrderGroupStatusEnum < BaseEnum
        ::OrderGroups::StatusEnum::STATUS.each do |name, _value|
          value(name.to_s, name)
        end
      end
    end
  end
end
