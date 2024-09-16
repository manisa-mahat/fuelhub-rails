class CreateDeliveryOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :delivery_orders do |t|
      t.string :planned_at
      t.string :completed_at
      t.references :consumer_outlet, null: false, foreign_key: true
      t.references :order_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
