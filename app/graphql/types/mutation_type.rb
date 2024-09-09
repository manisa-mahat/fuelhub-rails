module Types
  class MutationType < Types::BaseObject
    field :create_product, mutation: Mutations::Product::CreateProduct
    field :create_user, mutation: Mutations::User::CreateUser
    field :login_user, mutation: Mutations::User::LoginUser
    field :logout_user, mutation: Mutations::User::LogoutUser

    field :create_resource, description: "Mutation for creating resource", mutation: Mutations::Resource::CreateResourceMutation
    field :delete_resource, description: "Mutation for deleting resource", mutation: Mutations::Resource::DeleteResourceMutation
    field :update_resource, description: "Mutation for updating resource", mutation: Mutations::Resource::UpdateResourceMutation
  end
end
