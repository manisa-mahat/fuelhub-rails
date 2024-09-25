# module ChildGroup
#   class ChildGroupService
#     def initialize(child_group)
#       @child_group = child_group
#     end

#     def update_child_group(attributes)
#       if created_after_recurring?
#         @child_group.update(attributes)
#       else
#         raise StandardError.new("Cannot update: Child group not created after recurring order.")
#       end
#     end

#     def delete_child_group
#       if created_after_recurring?
#         @child_group.destroy
#       else
#         raise StandardError.new("Cannot delete: Child group not created after recurring order.")
#       end
#     end

#     private

#     def created_after_recurring?
#       @child_group.created_at > @child_group.order_group.created_at
#     end
#   end
# end
