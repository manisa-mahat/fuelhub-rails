class ModifyLineItemsTable < ActiveRecord::Migration[7.2]
  def change
    remove_column :line_items, :quantity, :string
    remove_column :line_items, :status, :string

    add_column :line_items, :product_id, :bigint, null: false

    add_index :line_items, :product_id
  end
end
