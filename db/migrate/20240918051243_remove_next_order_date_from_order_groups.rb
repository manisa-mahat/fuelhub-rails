class RemoveNextOrderDateFromOrderGroups < ActiveRecord::Migration[7.2]
  def change
    remove_column :order_groups, :next_order_date, :datetime
  end
end
