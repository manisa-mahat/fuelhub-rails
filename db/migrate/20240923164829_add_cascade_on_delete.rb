class AddCascadeOnDelete < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :child_groups, :order_groups if foreign_key_exists?(:child_groups, :order_groups)
    remove_foreign_key :delivery_orders, :child_groups if foreign_key_exists?(:delivery_orders, :child_groups)
    remove_foreign_key :consumer_outlets, :consumers if foreign_key_exists?(:consumer_outlets, :consumers)

    add_foreign_key :child_groups, :order_groups, on_delete: :cascade
    add_foreign_key :delivery_orders, :child_groups, on_delete: :cascade
    add_foreign_key :consumer_outlets, :consumers, on_delete: :cascade
  end
end
