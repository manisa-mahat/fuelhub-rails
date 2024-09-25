class Drivers < ActiveRecord::Migration[7.2]
  def change
    create_table :drivers, force: :cascade do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :status
      t.bigint :tenant_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end

    add_index :drivers, :tenant_id
    add_index :drivers, :user_id
  end
end
