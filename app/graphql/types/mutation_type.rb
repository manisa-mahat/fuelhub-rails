module Types
  class MutationType < Types::BaseObject
    # Product Mutations
    field :create_product, mutation: Mutations::Product::CreateProduct, description: "Mutation for creating a product"
    field :delete_product, mutation: Mutations::Product::DeleteProduct, description: "Mutation for deleting a product"
    field :update_product, mutation: Mutations::Product::UpdateProduct, description: "Mutation for updating a product"

    # Outlet Mutations
    field :create_outlet, mutation: Mutations::Outlet::CreateOutlet, description: "Mutation for creating an outlet"
    field :delete_outlet, mutation: Mutations::Outlet::DeleteOutlet, description: "Mutation for deleting an outlet"
    field :update_outlet, mutation: Mutations::Outlet::UpdateOutlet, description: "Mutation for updating an outlet"

    # User Mutations
    field :create_user, mutation: Mutations::User::CreateUser, description: "Mutation for creating a user"
    field :login_user, mutation: Mutations::User::LoginUser, description: "Mutation for user login"
    field :logout_user, mutation: Mutations::User::LogoutUser, description: "Mutation for user logout"

    # Resource Mutations
    field :create_resource, mutation: Mutations::Resource::CreateResourceMutation, description: "Mutation for creating a resource"
    field :delete_resource, mutation: Mutations::Resource::DeleteResourceMutation, description: "Mutation for deleting a resource"
    field :update_resource, mutation: Mutations::Resource::UpdateResourceMutation, description: "Mutation for updating a resource"

    # Consumer Mutations
    field :create_consumer, mutation: Mutations::Consumer::CreateConsumer, description: "Mutation for creating a consumer"
    field :update_consumer, mutation: Mutations::Consumer::UpdateConsumer, description: "Mutation for updating a consumer"
    field :delete_consumer, mutation: Mutations::Consumer::DeleteConsumer, description: "Mutation for deleting a consumer"

     # Driver Mutations
     field :create_driver, mutation: Mutations::Driver::CreateDriver, description: "Mutation for creating a driver"
     field :update_driver, mutation: Mutations::Driver::UpdateDriver, description: "Mutation for updating a driver"
     field :delete_driver, mutation: Mutations::Driver::DeleteDriver, description: "Mutation for deleting a driver"

    # OrderGroup Mutations
    field :create_order_group, mutation: Mutations::OrderGroup::CreateOrderGroup, description: "Mutation for creating an order group"
    field :update_order_group, mutation: Mutations::OrderGroup::UpdateOrderGroup, description: "Mutation for updating an order group"
    field :delete_order_group, mutation: Mutations::OrderGroup::DeleteOrderGroup, description: "Mutation for deleting an order group"

    # DeliveryOrder Mutations
    field :update_delivery_order, mutation: Mutations::DeliveryOrder::UpdateDeliveryOrder, description: "Mutation for updating a delivery order"
    field :delete_delivery_order, mutation: Mutations::DeliveryOrder::DeleteDeliveryOrder, description: "Mutation for deleting a delivery order"

    # LineItem Mutations
    field :update_line_item, mutation: Mutations::LineItem::UpdateLineItem, description: "Mutation for updating a line item"
    field :delete_line_item, mutation: Mutations::LineItem::DeleteLineItem, description: "Mutation for deleting a line item"
  end
end
