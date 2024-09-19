class RemovePhoneNumberFromConsumer < ActiveRecord::Migration[7.2]
  def change
    remove_column :consumers, :phone_number, :integer
  end
end
