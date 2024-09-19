class AddPhoneNumberToConsumer < ActiveRecord::Migration[7.2]
  def change
    add_column :consumers, :phone_number, :string
  end
end
