module Types
  module InputObjects
    class DriverInputType < BaseInputObject
      argument :name, String, required: true
      argument :phone, String, required: true
      argument :email, String, required: true
      argument :status, Enums::DriversEnums::StatusEnum, required: true
      argument :tenant_id, ID, required: true
    end
  end
end
