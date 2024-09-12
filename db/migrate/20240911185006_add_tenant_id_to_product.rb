class AddTenantIdToProduct < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :tenant, null: false, foreign_key: true
  end
end
