class AddTenantIdToLineItems < ActiveRecord::Migration[7.2]
  def change
    add_column :line_items, :tenant_id, :integer
  end
end
