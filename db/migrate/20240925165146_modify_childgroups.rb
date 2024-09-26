class ModifyChildgroups < ActiveRecord::Migration[7.2]
  def change
    remove_column :child_groups, :planned_at, :string
    remove_column :child_groups, :completed_at, :string

    add_column :child_groups, :planned_at, :datetime
    add_column :child_groups, :completed_at, :datetime
  end
end
