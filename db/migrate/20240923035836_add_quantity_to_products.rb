class AddQuantityToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :line_items, :quantity, :integer
  end
end
