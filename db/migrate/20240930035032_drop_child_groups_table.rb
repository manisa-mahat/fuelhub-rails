class DropChildGroupsTable < ActiveRecord::Migration[7.2]
  def change
     remove_foreign_key :delivery_orders, :child_groups
    drop_table :child_groups
  end
end
