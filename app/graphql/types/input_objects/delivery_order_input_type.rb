module Types
  module InputObjects
    class DeliveryOrderInputType < BaseInputObject
      argument :planned_at, GraphQL::Types::ISO8601DateTime, required: true
      argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :consumer_outlet_id, ID, required: true
      argument :line_items_attributes, [ Types::InputObjects::LineItemInputType ], required: false
    end
  end
end
