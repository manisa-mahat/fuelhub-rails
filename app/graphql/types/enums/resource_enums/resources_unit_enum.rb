module Types
  module Enums
    module ResourceEnums
      class ResourcesUnitEnum < BaseEnum
        ::Resources::ResourceUnitEnum::UNIT.each do |name, _value|
          value(name, name)
        end
      end
    end
  end
end
