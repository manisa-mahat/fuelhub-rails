# frozen_string_literal: true

module Types
  module Consumer
    class ConsumerType < Types::BaseObject
      field :id, ID, null: false
      field :name, String
      field :address, String
      field :tenant_id, Integer
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :email, String, null: false
      field :phone_number, String, null: false
    end
  end
end
