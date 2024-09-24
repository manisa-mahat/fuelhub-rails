class RemoveParentIdFromOrderGroups < ActiveRecord::Migration[7.2]
  def change
     remove_column :order_groups, :parent_id, :integer
  end
end
