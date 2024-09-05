module Mutations
  module Product
    class CreateProduct < BaseMutation
      argument :category, Types::Enums::ProductsEnums::CategoryEnum, required: true
      argument :name, Types::Enums::ProductsEnums::NameEnum, required: true
      argument :status, Types::Enums::ProductsEnums::StatusEnum, required: true
      argument :unit, Types::Enums::ProductsEnums::UnitEnum, required: true

      field :product, Types::Product::ProductType, null: true
      field :errors, [ String ], null: false

      def resolve(category:, name:, status:, unit:)
        # debugger
        product = ::Product.new(category: category, name: name, status: status, unit: unit)
        if product.save
          {
            product: product, errors: []
          } else {
            product: nil, errors: product.errors.full_messages
          }
        end
      end
    end
  end
end
