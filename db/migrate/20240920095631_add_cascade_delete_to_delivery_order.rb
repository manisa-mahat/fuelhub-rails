class AddCascadeDeleteToDeliveryOrder < ActiveRecord::Migration[7.2]
  def change
     remove_foreign_key :delivery_orders, :order_groups
      add_foreign_key :delivery_orders, :order_groups, on_delete: :cascade
  end
end
