module Mutations
  module Consumer
    class DeleteConsumer < BaseMutation
      argument :consumer_id, ID, required: true

      field :success, Boolean, null: false
      field :errors, [ String ], null: false

      def resolve(consumer_id:)
        begin
          current_user = context[:current_user]
          current_tenant = Tenant.find_by(id: current_user.tenant_id)
          consumer = ::Consumer.find_by(id: consumer_id, tenant_id: current_tenant.id)

          if consumer
            consumer.destroy
            {
              success: true,
              errors: []
            }
          else
            {
              success: false,
              errors: [ "Consumer not found" ]
            }
          end
        rescue GraphQL::ExecutionError => err
          {
            success: false,
            errors: [ err.message ]
          }
        end
      end
    end
  end
end
