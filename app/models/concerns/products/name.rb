module Products
  module Name
    extend ActiveSupport::Concern


    NAME = { petrol: "petrol", diesel: "diesel", kerosene: "kerosene",
    engine_oil: "engine_oil", gear_oil: "gear_oil",
    fuel_additive: "fuel_additive", engine_additive: "engine_additive" }.freeze

    included do
      enum name: NAME

      validate :name_belong_to_category
    end

    private

    def name_belong_to_category
      category_name_mapping={
        fuel: %w[petrol diesel kerosene],
        lubricants: %w[engine_oil gear_oil],
        additives: %w[fuel_additive engine_additive]
      }
      valid_names = category_name_mapping[category.to_sym]
      unless valid_names&.include?(name.to_s)
        errors.add(:name, "does not belong to the #{category} category")
      end
    end
  end
end
