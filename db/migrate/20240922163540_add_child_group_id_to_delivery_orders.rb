class AddChildGroupIdToDeliveryOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :delivery_orders, :child_group_id, :bigint
    add_index :delivery_orders, :child_group_id
    add_foreign_key :delivery_orders, :child_groups
  end
end
