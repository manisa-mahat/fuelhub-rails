class CreateConsumers < ActiveRecord::Migration[7.2]
  def change
    create_table :consumers do |t|
      t.string :name
      t.integer :tenant_id

      t.timestamps
    end
  end
end
