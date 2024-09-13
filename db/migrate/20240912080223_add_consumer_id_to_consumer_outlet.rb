class AddConsumerIdToConsumerOutlet < ActiveRecord::Migration[7.2]
  def change
    add_reference :consumer_outlets, :consumer, null: false, foreign_key: true
  end
end
