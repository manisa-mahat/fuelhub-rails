class AddParentIdToOrderGroup < ActiveRecord::Migration[7.2]
  def change
     add_column :order_groups, :parent_id, :Integer
  end
end
