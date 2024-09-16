module OrderGroups
  module StatusEnum
    extend ActiveSupport::Concern

    STATUS = {
      pending: "pending",
      verified: "verified",
      unverified: "unverified"
    }.freeze

    included do
      enum status: STATUS
    end
  end
end
