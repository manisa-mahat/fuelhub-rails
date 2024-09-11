module Mutations
  module Product
    class DeleteProduct < BaseMutation
      argument :id, ID, required: true

      field :product, Types::Product::ProductType, null: true
      field :errors, [ String ], null: false

      def resolve(id: [])
        begin
          product_service = ::Products::ProductService.new({ id: id }).execute_delete_product
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
