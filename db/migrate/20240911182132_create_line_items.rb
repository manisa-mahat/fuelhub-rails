class CreateLineItems < ActiveRecord::Migration[7.2]
  def change
    create_table :line_items do |t|
      t.string :name
      t.string :quantity
      t.string :unit
      t.string :status
      t.references :delivery_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
