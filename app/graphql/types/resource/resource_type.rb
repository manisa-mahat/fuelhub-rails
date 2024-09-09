# frozen_string_literal: true

module Types
  module Resource
    class ResourceType < Types::BaseObject
      field :id, ID, null: false
      field :resource_id, String, null: false
      field :resource_status, Enums::ResourceEnums::StatusEnum, null: false
      field :resource_category, Enums::ResourceEnums::CategoryEnum, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :tenant_id, ID, null: false
      field :user_id, ID, null: false

      # Batch loading to prevent N+1 query issues
      # field :tenant, Types::TenantType, null: true, preload: { tenant: :tenant }
      # field :user, Types::UserType, null: true, preload: { user: :user }
    end
  end
end
