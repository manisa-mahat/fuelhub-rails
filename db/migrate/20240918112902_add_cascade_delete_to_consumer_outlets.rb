class AddCascadeDeleteToConsumerOutlets < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :consumer_outlets, :consumers
    add_foreign_key :consumer_outlets, :consumers, on_delete: :cascade
  end
end
