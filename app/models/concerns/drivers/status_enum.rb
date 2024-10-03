module Drivers
  module StatusEnum
    extend ActiveSupport::Concern

    STATUS = {
      active: "ACTIVE",
      inactive: "INACTIVE"
    }.freeze

    included do
      enum status: STATUS
    end
  end
end
