module Mutations
  module Product
    class DeleteProduct < BaseMutation
      argument :id, ID, required: true

      field :product, Types::Product::ProductType, null: true
      field :message, String, null: false
      field :errors, [ String ], null: false

      def resolve(id:)
        begin
          product_service = ::Products::ProductService.new({ id: id }.to_h.merge(current_user: context[:current_user])).execute_delete_product
          if product_service.success?
            {
              product: product_service.product,
              message: "Product Deleted.",
              errors: []
            }
          else
            {
              product: nil,
              message: "Cannot delete product.",
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
