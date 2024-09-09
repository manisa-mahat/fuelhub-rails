module Types
  module InputObjects
    class ResourceInputType < BaseInputObject
      argument :resource_id, String, required: true
      argument :resource_status, Enums::ResourceEnums::StatusEnum, required: true
      argument :resource_category, Enums::ResourceEnums::CategoryEnum, required: true
      argument :user_id, ID, required: true
      argument :tenant_id, ID, required: true
    end
  end
end
