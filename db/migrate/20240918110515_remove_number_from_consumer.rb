class RemoveNumberFromConsumer < ActiveRecord::Migration[7.2]
  def change
    remove_column :consumers, :phone_number, :bigint
  end
end
