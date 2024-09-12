class DropDeliveryOrders < ActiveRecord::Migration[7.2]
  def change
    drop_table :delivery_orders
  end
end
