module Resources::ResourceUnitEnum
  extend ActiveSupport::Concern
    UNIT = {
      liters: "liters",
      gallon: "gallon"
  }.freeze
  included do
    enum unit: UNIT
  end
end
