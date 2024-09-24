class RemoveRecurringFromOrderGroups < ActiveRecord::Migration[7.2]
  def change
    remove_column :order_groups, :recurring, :Boolean
  end
end
