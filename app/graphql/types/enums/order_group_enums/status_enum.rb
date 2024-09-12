module Types
  module Enums
    module OrderGroupEnums
      class StatusEnum < BaseEnum
        ::OrderGroups::StatusEnum::STATUS.each do |name, _value|
          value(name.to_s.upcase, name)
        end
      end
    end
  end
end
