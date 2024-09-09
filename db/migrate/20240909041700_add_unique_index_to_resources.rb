class AddUniqueIndexToResources < ActiveRecord::Migration[6.1]
  def change
    add_index :resources, :resource_id, unique: true
  end
end
