module Mutations
  module Consumer
    class UpdateConsumer < BaseMutation
      argument :id, ID, required: true
      argument :consumer_details, Types::Inputs::ConsumerInput, required: true

      field :consumer, Types::Consumer::ConsumerType, null: true
      field :errors, [ String ], null: false

      def resolve(id:, consumer_details: {})
        begin
          current_user = context[:current_user]
          current_tenant = Tenant.find_by(id: current_user.tenant_id)
          params = consumer_details.to_h.merge(tenant_id: current_tenant.id, id: id)
          consumer_service = ::Consumers::ConsumerService.new(params).execute_update_consumer
          if consumer_service.success?
            {
              consumer: consumer_service.consumer,
              errors: []
            }
          else
            {
              consumer: nil,
              errors: consumer_service.errors
            }
          end
        rescue GraphQL::ExecutionError => err
          {
            consumer: nil,
            errors: [ err.message ]
          }
        end
      end
    end
  end
end
