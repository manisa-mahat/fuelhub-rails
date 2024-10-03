class RemoveChildGroupIdFromDeliveryOrders < ActiveRecord::Migration[7.2]
  def change
      remove_column :delivery_orders, :child_group_id, :bigint
  end
end
