class ChangeUniqueIndexOnUsers < ActiveRecord::Migration[7.2]
  def change
    remove_index :users, :email
    add_index :users, [ :email, :role ], unique: true
  end
end
