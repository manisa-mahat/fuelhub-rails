# module Resolvers
#   module Products
#     class ProductResolver < BaseResolver
#       type Types::Product::ProductResponseType, null: true
#       def resolve
#         begin
#           products = Product.order(created_at: :DESC)
#           {
#             products: products,
#             errors: []
#           }
#         rescue GraphQL::ExecutionError => err
#           {
#             products: nil,
#             errors: [ err.message ]
#           }
#         end
#       end
#     end
#   end
# end


module Resolvers
  module Products
    class ProductResolver < BaseResolver
      type Types::Product::ProductResponseType, null: true

      def resolve
        product_service = ::Products::ProductService.new(current_user: context[:current_user])
        product_service.execute_get_product

        if product_service.success?
          {
            products: product_service.products,
            errors: []
          }
        else
          {
            products: nil,
            errors: product_service.errors
          }
        end
      end
    end
  end
end
