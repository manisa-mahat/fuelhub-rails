module Resources::ResourceCategoryEnum
  extend ActiveSupport::Concern
    CATEGORY = {
      tanker_truck: "tanker_truck",
      rails_tank: "rail_tank",
      tank_wagon: "tank_wagon",
      tanker_LNG: "tanker_LNG",
      bitumen_truck: "bitumen_truck"
    }.freeze

    included do
      enum resource_category: CATEGORY
    end
end
