module Types
  module Outlet
    class  OutletResponseType
      field :outlets, [ Types::Outlet::ConsumerOutletType ], null: false
      field :errors, [ String ], null: true
    end
  end
end
