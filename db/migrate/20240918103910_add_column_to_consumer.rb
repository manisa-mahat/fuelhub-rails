class AddColumnToConsumer < ActiveRecord::Migration[7.2]
  def change
    add_column :consumers, :email, :string
    add_column :consumers, :phone_number, :integer
  end
end
