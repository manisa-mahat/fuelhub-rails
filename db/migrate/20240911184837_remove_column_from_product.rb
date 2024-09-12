class RemoveColumnFromProduct < ActiveRecord::Migration[7.2]
  def change
    remove_column :products, :tenant_id, :integer
    remove_column :products, :user_id, :integer
  end
end
