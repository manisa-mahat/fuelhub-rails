class AddCascadeDeleteToOrderGroups < ActiveRecord::Migration[7.2]
  def change
     remove_foreign_key :order_groups, :consumers
      add_foreign_key :order_groups, :consumers, on_delete: :cascade
  end
end
