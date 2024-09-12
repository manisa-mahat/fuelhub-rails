module Types
  module Outlet
    class  OutletResponseType < BaseObject
      field :consumer_outlets, [ Types::Outlet::ConsumerOutletType ], null: true
      field :errors, [ String ], null: true
    end
  end
end
