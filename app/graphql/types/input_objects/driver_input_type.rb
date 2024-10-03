module Types
  module InputObjects
    class DriverInputType < BaseInputObject
      argument :name, String, required: true
      argument :phone, String, required: true
      argument :email, String, required: true
      argument :license_number, String, required: true
      argument :status, Enums::DriversEnums::DriverStatusEnums, required: true
    end
  end
end
