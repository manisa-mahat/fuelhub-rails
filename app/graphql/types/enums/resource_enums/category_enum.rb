module Types
  module Enums
    module ResourceEnums
      class CategoryEnum < BaseEnum
        ::Resources::ResourceCategoryEnum::CATEGORY.each do |name, _value|
          value name, name
        end
      end
    end
  end
end
