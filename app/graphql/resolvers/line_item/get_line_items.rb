module Resolvers
  module LineItem
    class GetLineItems < Resolvers::BaseResolver
      type [ Types::LineItem::LineItemResponseType ], null: true

      argument :status, Types::Enums::LineItemEnum::LineItemStatusEnum, required: false

      def resolve(status: nil)
        if status
          ::LineItem.where(status: status)
        else
          ::LineItem.all
        end
      end
    end
  end
end
