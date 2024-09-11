module Types
  class DriverType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :phone, String, null: false
    field :email, String, null: false
    field :status, Enums::DriversEnums::StatusEnum, null: false
    field :tenant_id, ID, null: false
    field :user_id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
