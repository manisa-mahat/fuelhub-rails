class ChangeDateFieldsToDatetimeInOrderGroups < ActiveRecord::Migration[7.2]
  def change
    change_column :order_groups, :start_date, :datetime
    change_column :order_groups, :end_date, :datetime
  end
end
