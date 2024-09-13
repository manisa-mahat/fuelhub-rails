# frozen_string_literal: true

module Types
  module Outlet
    class ConsumerOutletType < Types::BaseObject
      field :id, ID, null: false
      field :name, String
      field :address, String
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :consumer_id, ID, null: false
    end
  end
end
