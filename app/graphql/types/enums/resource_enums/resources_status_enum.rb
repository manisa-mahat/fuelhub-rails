module Types
  module Enums
    module ResourceEnums
      class ResourcesStatusEnum < BaseEnum
        ::Resources::ResourceStatusEnum::STATUS.each do |name, _value|
          value(name, name)
        end
      end
    end
  end
end
