class AddParentOrderIdToOrderGroups < ActiveRecord::Migration[7.2]
  def change
    add_column :order_groups, :parent_order_id, :integer
  end
end
