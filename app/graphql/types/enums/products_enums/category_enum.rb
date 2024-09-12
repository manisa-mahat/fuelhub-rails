module Types
  module Enums
    module ProductsEnums
      class CategoryEnum < BaseEnum
        ::Products::Category::CATEGORY.each do |name, value|
          value(name, value)
        end
      end
    end
  end
end
