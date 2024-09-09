module Resources::ResourceStatusEnum
  extend ActiveSupport::Concern
    STATUS = {
      active: "Active",
      inactive: "Inactive"
}.freeze
  included do
    enum resource_status: STATUS
  end
end