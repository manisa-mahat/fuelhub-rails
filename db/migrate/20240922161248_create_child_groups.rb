class CreateChildGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :child_groups do |t|
      t.string :status
      t.string :planned_at
      t.string :completed_at
      t.bigint :consumer_id, null: false
      t.bigint :user_id, null: false
      t.bigint :tenant_id, null: false
      t.bigint :order_group_id, null: false, index: true

      t.index :consumer_id
      t.index :user_id
      t.index :tenant_id
      t.timestamps
    end
    add_foreign_key :child_groups, :order_groups, column: :order_group_id
  end
end
