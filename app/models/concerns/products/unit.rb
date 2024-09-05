module Products
  module Unit
    extend ActiveSupport::Concern

    UNIT = { liters: "liters", gallons: "gallons", units: "units" }.freeze

    included do
      enum unit: UNIT
    end
  end
end
