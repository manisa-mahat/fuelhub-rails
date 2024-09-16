module LineItems
  module StatusEnum
    extend ActiveSupport::Concern
    STATUS = {
      scheduled: "scheduled",
      skipped: "skipped",
      delivered: "delivered"
    }.freeze
    included do
      enum status: STATUS
    end
  end
end
