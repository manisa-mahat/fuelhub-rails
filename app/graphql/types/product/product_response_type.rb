<<<<<<< HEAD
module Types
  module Product
    class ProductResponseType
      field :products, [ Types::Product::ProductType ], null: false
      field :errors, [ String ], null: true
    end
  end
end
=======
module Types
  module Product
    class ProductResponseType < Types::BaseObject
      field :products, [ Types::Product::ProductType ], null: false
      field :errors, [ String ], null: true
    end
  end
end
>>>>>>> 705db1a262ae5ebe02ecb1e36d2123808908c651
