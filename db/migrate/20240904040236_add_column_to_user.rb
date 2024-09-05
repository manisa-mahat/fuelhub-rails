class AddColumnToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :tenant_id, :integer
  end
end
