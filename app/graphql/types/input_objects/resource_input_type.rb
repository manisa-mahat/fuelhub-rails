module Types
  module InputObjects
    class ResourceInputType < BaseInputObject
      argument :id, ID, required: false
      argument :resource_status, Enums::ResourceEnums::ResourcesStatusEnum, required: true
      argument :resource_category, Enums::ResourceEnums::ResourcesCategoryEnum, required: true
      argument :unit, Enums::ResourceEnums::ResourcesUnitEnum, required: true
      argument :name, String, required: true
      argument :capacity, Integer, required: true
      argument :vehicle_id, String, required: true
    end
  end
end
