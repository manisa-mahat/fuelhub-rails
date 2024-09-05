# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_product, mutation: Mutations::Product::CreateProduct
  end
end
