class AddForeignKeyToLineItems < ActiveRecord::Migration[7.2]
  def change
     remove_foreign_key :line_items, :delivery_orders
    add_foreign_key :line_items, :delivery_orders, on_delete: :cascade
  end
end
