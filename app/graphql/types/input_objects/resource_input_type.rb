module Types
  module InputObjects
    class ResourceInputType < BaseInputObject
      argument :id, ID, required: false
      argument :resource_status, Enums::ResourceEnums::ResourcesStatusEnum, required: true
      argument :resource_category, Enums::ResourceEnums::ResourcesCategoryEnum, required: true
      # argument :tenant_id, ID, required: true
    end
  end
end
