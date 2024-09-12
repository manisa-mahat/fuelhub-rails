module Types
  module Enums
    module ResourceEnums
      class ResourcesCategoryEnum < BaseEnum
        ::Resources::ResourceCategoryEnum::CATEGORY.each do |name, _value|
          value name, name
        end
      end
    end
  end
end
