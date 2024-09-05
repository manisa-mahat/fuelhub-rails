module Products
  module Status
    extend ActiveSupport::Concern

    STATUS = { available: "available", out_of_stock: "out_of_stock", discontinued: "discontinued" }.freeze


    included do
      enum status: STATUS
    end
  end
end
