module Products
  module Category
    extend ActiveSupport::Concern

    CATEGORY = { fuel: "fuel", lubricants: "lubricants", additives: "additives" }.freeze

    included do
      enum category: CATEGORY
    end
  end
end
