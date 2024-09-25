class Modify < ActiveRecord::Migration[7.2]
  def change
    remove_column :order_groups, :planned_at, :string
    remove_column :order_groups, :completed_at, :string

    add_column :order_groups, :planned_at, :datetime
    add_column :order_groups, :completed_at, :datetime
  end
end
