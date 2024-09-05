module Types
  module Enums
    module ProductsEnums
      class NameEnum < BaseEnum
        ::Products::Name::NAME.each do |name, value|
          value(name, value)
        end
      end
    end
  end
end
