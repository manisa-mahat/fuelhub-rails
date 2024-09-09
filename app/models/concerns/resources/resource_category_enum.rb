module Resources::ResourceCategoryEnum
  extend ActiveSupport::Concern
    CATEGORY = {
      trailer: "trailer",
      truck: "truck",
      tank_wagon: "tank_wagon"
    }.freeze

    included do
      enum resource_category: CATEGORY
    end
end