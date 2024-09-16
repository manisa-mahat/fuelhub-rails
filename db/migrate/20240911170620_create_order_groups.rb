class CreateOrderGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :order_groups do |t|
      t.string :status
      t.string :planned_at
      t.string :completed_at
      t.references :consumer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
    t.index [ "consumer_id" ], name: "index_order_groups_on_consumer_id"
    t.index [ "tenant_id" ], name: "index_order_groups_on_tenant_id"
    t.index [ "user_id" ], name: "index_order_groups_on_user_id"
  end
end
