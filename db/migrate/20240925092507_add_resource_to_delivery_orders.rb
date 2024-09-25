class AddResourceToDeliveryOrders < ActiveRecord::Migration[7.2]
  def change
     add_reference :delivery_orders, :resource, foreign_key: true, null: true
  end
end
