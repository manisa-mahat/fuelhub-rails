module Types
  module Enums
    module ResourceEnums
      class StatusEnum < BaseEnum
        ::Resources::ResourceStatusEnum::STATUS.each do |name, _value|
          value(name, name)
        end
      end
    end
  end
end
