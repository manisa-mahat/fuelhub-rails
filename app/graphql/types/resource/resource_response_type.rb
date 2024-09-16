module Types
  module Resource
    class ResourceResponseType < Types::BaseObject
      field :resources, [ Types::Resource::ResourceType ], null: false
      field :errors, [ String ], null: false
    end
  end
end
