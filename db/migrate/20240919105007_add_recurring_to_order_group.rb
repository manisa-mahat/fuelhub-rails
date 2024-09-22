class AddRecurringToOrderGroup < ActiveRecord::Migration[7.2]
  def change
    add_column :order_groups, :recurring, :Boolean
  end
end
