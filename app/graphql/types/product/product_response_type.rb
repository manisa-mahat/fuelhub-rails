module Types
  module Product
    class ProductResponseType < Types::BaseObject
      field :products, [ Types::Product::ProductType ], null: false
      field :errors, [ String ], null: true
    end
  end
end
