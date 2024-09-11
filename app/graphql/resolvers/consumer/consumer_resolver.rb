module Resolvers
  module Consumer
    class ConsumerResolver < BaseResolver
      type Types::Consumer::ConsumerType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        ::Consumer.find(id)
      end
    end
  end
end
