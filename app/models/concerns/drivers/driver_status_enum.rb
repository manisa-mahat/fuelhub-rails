module Drivers
  module DriverStatusEnum
    extend ActiveSupport::Concern

    STATUS = {
      active: "Active",
      inactive: "Inactive"
    }.freeze

    included do
      enum status: STATUS
    end
  end
end
