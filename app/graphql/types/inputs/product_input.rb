<<<<<<< HEAD
module Types
  module Inputs
    class ProductInput < BaseInputObject
      argument :category, Types::Enums::ProductsEnums::CategoryEnum, required: true
      argument :name, Types::Enums::ProductsEnums::NameEnum, required: true
      argument :status, Types::Enums::ProductsEnums::StatusEnum, required: true
      argument :unit, Types::Enums::ProductsEnums::UnitEnum, required: true
    end
  end
end
=======
module Types
  module Inputs
    class ProductInput < BaseInputObject
      argument :id, ID, required: false
      argument :category, Types::Enums::ProductsEnums::CategoryEnum, required: true
      argument :name, Types::Enums::ProductsEnums::NameEnum, required: true
      argument :status, Types::Enums::ProductsEnums::StatusEnum, required: true
      argument :unit, Types::Enums::ProductsEnums::UnitEnum, required: true
    end
  end
end
>>>>>>> 705db1a262ae5ebe02ecb1e36d2123808908c651
