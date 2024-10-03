module Types
  module Driver
    class DriverType < Types::BaseObject
      field :id, ID, null: true
      field :name, String, null: false
      field :phone, String, null: false
      field :email, String, null: false
      field :license_number, String, null: false
      field :status, Enums::DriversEnums::DriverStatusEnums, null: false
      field :tenant_id, ID, null: false
      field :user_id, ID, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
