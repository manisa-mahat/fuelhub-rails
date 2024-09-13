module Types
  module Enums
    module ProductsEnums
      class UnitEnum < BaseEnum
        ::Products::Unit::UNIT.each do |name, value|
          value(name, value)
        end
      end
    end
  end
end
