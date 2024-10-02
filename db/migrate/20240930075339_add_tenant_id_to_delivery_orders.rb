class AddTenantIdToDeliveryOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :delivery_orders, :tenant_id, :integer
  end
end
