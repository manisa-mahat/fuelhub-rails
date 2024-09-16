class DropAndRecreateUserIndexes < ActiveRecord::Migration[7.2]
  def change
    remove_index :users, column: [ :email, :role ] if index_exists?(:users, [ :email, :role ])
    add_index :users, [ :email, :role ], unique: true
  end
end
