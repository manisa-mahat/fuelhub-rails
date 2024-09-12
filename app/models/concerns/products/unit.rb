module Products
  module Unit
    extend ActiveSupport::Concern

    UNIT = { liters: "liters", gallons: "gallons" }.freeze

    included do
      enum unit: UNIT
    end
  end
end
