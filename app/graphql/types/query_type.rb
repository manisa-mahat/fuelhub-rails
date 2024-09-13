module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end
    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :user, resolver: Resolvers::User::UserResolver
    field :tenant, resolver: Resolvers::Tenant::TenantResolver
    field :get_resources, resolver: Resolvers::Resource::GetResource, description: "Fetch all resources"
    field :consumer, resolver: Resolvers::Consumer::ConsumerResolver
    field :consumers, resolver: Resolvers::Consumer::ConsumersResolver
    field :outlets, resolver: Resolvers::Outlets::OutletResolver
    field :get_driver, resolver: Resolvers::Driver::GetDriver
    field :get_order_group, resolver: Resolvers::OrderGroup::GetOrderGroup, description: "Fetch a single OrderGroup by ID"
    field :get_order_groups, resolver: Resolvers::OrderGroup::GetOrderGroups, description: "Fetch multiple OrderGroups, optionally filtered by status"
    field :get_delivery_order, resolver: Resolvers::DeliveryOrder::GetDeliveryOrder, description: "Fetch a single DeliveryOrder by ID"
    field :get_delivery_orders, resolver: Resolvers::DeliveryOrder::GetDeliveryOrders, description: "Fetch multiple DeliveryOrders"
    field :get_line_item, resolver: Resolvers::LineItem::GetLineItem, description: "Fetch a single LineItem by ID"
    field :get_line_items, resolver: Resolvers::LineItem::GetLineItems, description: "Fetch multiple LineItems, optionally filtered by status"
  end
end
