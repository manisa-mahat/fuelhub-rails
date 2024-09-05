class AddTenantIdToProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :tenant_id, :integer
  end
end
