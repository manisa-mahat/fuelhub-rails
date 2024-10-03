class RemoveIndexOnChildGroupIdFromDeliveryOrders < ActiveRecord::Migration[7.2]
  def change
    remove_index :delivery_orders, name: "index_delivery_orders_on_child_group_id"
    remove_column :delivery_orders, :child_group_id, :bigint
  end
end
