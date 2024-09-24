class AddDeliveryOrderToChildGroups < ActiveRecord::Migration[7.2]
  def change
    add_reference :child_groups, :delivery_order, foreign_key: true
  end
end
