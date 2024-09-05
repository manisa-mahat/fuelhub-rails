class AddColumnToProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :category, :string
    add_column :products, :name, :string
    add_column :products, :status, :string
    add_column :products, :unit, :string
  end
end
