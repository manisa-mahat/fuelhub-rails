class AddStartAndEndDateToOrderGroup < ActiveRecord::Migration[7.2]
  def change
    add_column :order_groups, :start_date, :date
    add_column :order_groups, :end_date, :date
  end
end
