module Types
  class MutationType < Types::BaseObject
    field :create_product, mutation: Mutations::Product::CreateProduct
    field :create_user, mutation: Mutations::User::CreateUser
    field :login_user, mutation: Mutations::User::LoginUser
    field :logout_user, mutation: Mutations::User::LogoutUser

    field :create_consumer, mutation: Mutations::Consumer::CreateConsumer
    field :update_consumer, mutation: Mutations::Consumer::UpdateConsumer
    field :delete_consumer, mutation: Mutations::Consumer::DeleteConsumer

    field :delete_product, mutation: Mutations::Product::DeleteProduct
    field :update_product, mutation: Mutations::Product::UpdateProduct

  end
end
