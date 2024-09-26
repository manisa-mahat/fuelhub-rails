class ModifyDeliveryOrders < ActiveRecord::Migration[7.2]
  def change
    remove_column :delivery_orders, :planned_at, :string
    remove_column :delivery_orders, :completed_at, :string

    add_column :delivery_orders, :planned_at, :datetime
    add_column :delivery_orders, :completed_at, :datetime
  end
end
