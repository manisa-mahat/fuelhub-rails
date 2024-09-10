class CreateResources < ActiveRecord::Migration[7.2]
  def change
    create_table :resources do |t|
      t.string :resource_category
      t.string :resource_status
      t.references :user, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
