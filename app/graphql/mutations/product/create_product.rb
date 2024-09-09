module Mutations
  module Product
    class CreateProduct < BaseMutation
      argument :product_details, Types::Inputs::ProductInput, required: true

      field :product, Types::Product::ProductType, null: true
      field :errors, [ String ], null: false

      def resolve(product_details: {})
        begin
          product_service = ::Products::ProductService.new(product_details.to_h).execute_create_product
          if product_service.success?
            {
              product: product_service.product,
              errors: []
            }
          else
            {
              product: nil,
              errors: product_service.errors
            }
          end
        rescue GraphQL::ExecutionError=> err
          {
            product: nil,
            errors: [ err.message ]
          }
        end
      end
    end
  end
end
