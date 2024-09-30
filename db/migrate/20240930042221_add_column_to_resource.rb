class AddColumnToResource < ActiveRecord::Migration[7.2]
  def change
    add_column :resources, :name, :string
    add_column :resources, :capacity, :integer
    add_column :resources, :vehicle_id, :string
    add_column :resources, :unit, :string
  end
end
