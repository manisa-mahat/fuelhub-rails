# frozen_string_literal: true

module Types
  module Resource
    class ResourceType < Types::BaseObject
      field :id, ID, null: false
      field :resource_status, Enums::ResourceEnums::ResourcesStatusEnum, null: false
      field :resource_category, Enums::ResourceEnums::ResourcesCategoryEnum, null: false
      field :unit, Enums::ResourceEnums::ResourcesUnitEnum, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :tenant_id, ID, null: false
      field :user_id, ID, null: false
      field :name, String, null: false
      field :capacity, Integer, null: false
      field :vehicle_id, String, null: false
    end
  end
end
