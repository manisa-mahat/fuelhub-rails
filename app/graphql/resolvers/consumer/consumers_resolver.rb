# module Resolvers
#   module Consumer
#     class ConsumersResolver < BaseResolver
#       type [ Types::Consumer::ConsumerType ], null: false

#       def resolve
#         ::Consumer.all
#       end
#     end
#   end
# end
module Resolvers
  module Consumer
    class ConsumersResolver < BaseResolver
      type [ Types::Consumer::ConsumerType ], null: false

      def resolve
        tenant_id = context[:current_user]&.tenant_id
        if tenant_id
          ::Consumer.where(tenant_id: tenant_id)
        else
          raise GraphQL::ExecutionError, "User is not logged in or tenant_id is missing"
        end
      end
    end
  end
end
