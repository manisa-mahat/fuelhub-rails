class AddRecurringFieldsToOrderGroups < ActiveRecord::Migration[7.2]
  def change
    add_column :order_groups, :recurring, :boolean
    add_column :order_groups, :frequency, :string
    add_column :order_groups, :next_order_date, :datetime
  end
end
