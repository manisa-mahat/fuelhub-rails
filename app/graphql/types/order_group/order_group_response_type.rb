module Types
  module OrderGroup
    class OrderGroupResponseType < BaseObject
      field :order_group, Types::OrderGroup::OrderGroupType, null: true
      field :order_groups, [ Types::OrderGroup::OrderGroupType ], null: true
      field :errors, [ String ], null: true
    end
  end
end
