class AddColumnToTenants < ActiveRecord::Migration[7.2]
  def change
    add_column :tenants, :name, :string
  end
end
