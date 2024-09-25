# module Mutations
#   module ChildGroup
#     class UpdateChildGroup < BaseMutation
#       argument :id, ID, required: true
#       argument :attributes, Types::Inputs::ChildGroupInput, required: true

#       field :child_group, Types::ChildGroup::ChildGroupType, null: true
#       field :errors, [ String ], null: false

#       def resolve(id:, attributes:)
#         child_group = ::ChildGroup.find_by(id: id)
#         return { child_group: nil, errors: [ "Child group not found" ] } unless child_group

#         service = ::ChildGroup::ChildGroupService.new(child_group)
#         begin
#           service.update_child_group(attributes.to_h)

#           {
#             child_group: child_group,
#             errors: []
#           }
#         rescue StandardError => e
#           {
#             child_group: nil,
#             errors: [ e.message ]
#           }
#         end
#       end
#     end
#   end
# end
