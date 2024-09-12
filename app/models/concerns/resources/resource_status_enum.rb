module Resources::ResourceStatusEnum
  extend ActiveSupport::Concern
    STATUS = {
      available: "Available",
      unavailable: "Unavailable"
}.freeze
  included do
    enum resource_status: STATUS
  end
end
