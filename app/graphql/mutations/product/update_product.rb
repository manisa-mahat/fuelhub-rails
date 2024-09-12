<<<<<<< HEAD
module Mutations
  module Product
    class UpdateProduct < BaseMutation
      argument :product_id, ID, required: true
      argument :product_details, Types::Inputs::ProductInput, required: true


      field :product, Types::Product::ProductType, null: true
      field :errors, [ String ], null: false

      def resolve(product_details: {}, product_id: [])
        begin
          params = product_details.to_h.merge(product_id: product_id)
          product_service = ::Products::ProductService.new(params).execute_update_product
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
=======
module Mutations
  module Product
    class UpdateProduct < BaseMutation
      argument :product_details, Types::Inputs::ProductInput, required: true

      field :product, Types::Product::ProductType, null: true
      field :errors, [ String ], null: false

      def resolve(product_details: {})
        begin
          product_service = ::Products::ProductService.new(product_details.to_h.merge(current_user: context[:current_user])).execute_update_product
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
>>>>>>> 705db1a262ae5ebe02ecb1e36d2123808908c651
