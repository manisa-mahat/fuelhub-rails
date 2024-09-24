class AddForeignKeyToOrderGroups < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :order_groups, :order_groups, column: :parent_id
  end
end
