class AddTenantToConsumerOutlets < ActiveRecord::Migration[7.2]
  def change
    add_reference :consumer_outlets, :tenant, null: false, foreign_key: true
  end
end
