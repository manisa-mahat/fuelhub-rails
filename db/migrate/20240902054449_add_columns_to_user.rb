class AddColumnsToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :email, :string
    add_column :users, :password, :string
    add_column :users, :role, :string
  end
end
