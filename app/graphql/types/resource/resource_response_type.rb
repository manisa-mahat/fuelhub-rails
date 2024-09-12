module Types
  module Resource
    class ResourceResponseType < Types::BaseObject
      field :resources, [ Types::Resource::ResourceType ], null: true
      field :errors, [ String ], null: true
    end
  end
end
