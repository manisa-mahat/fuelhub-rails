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
    # Define the `get_assets` query field
    field :get_resources, description: "Fetch all resources", resolver: Resolvers::Resource::GetResource
    field :consumer, resolver: Resolvers::Consumer::ConsumerResolver
    field :consumers, resolver: Resolvers::Consumer::ConsumersResolver
    field :outlets, resolver: Resolvers::Outlets::OutletResolver
    field :driver, resolver: Resolvers::Driver::GetDriver
  end
end
