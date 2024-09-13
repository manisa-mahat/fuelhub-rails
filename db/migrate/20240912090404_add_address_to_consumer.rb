class AddAddressToConsumer < ActiveRecord::Migration[7.2]
  def change
    add_column :consumers, :address, :string
  end
end
