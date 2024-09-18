class RemovePhoneNumberFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :phone_number, :bigint
  end
end
