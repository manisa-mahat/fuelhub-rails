class Removefield < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :role, :string

    add_index :users, :email, unique: true
  end
end
