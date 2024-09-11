module Resolvers
  module Consumer
    class ConsumersResolver < BaseResolver
      type [ Types::Consumer::ConsumerType ], null: false

      def resolve
        ::Consumer.all
      end
    end
  end
end
