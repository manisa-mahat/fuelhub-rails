class ChangePlannedAtAndCompletedAtInChildGroups < ActiveRecord::Migration[7.2]
  def change
    def up
    change_column :child_groups, :planned_at, :datetime, using: 'planned_at::timestamp without time zone'
    change_column :child_groups, :completed_at, :datetime, using: 'completed_at::timestamp without time zone'
    end

    def down
      change_column :child_groups, :planned_at, :string
      change_column :child_groups, :completed_at, :string
    end
  end
end
