module Types
  module Inputs
    class OutletInput < BaseInputObject
      argument :consumer_outlet_id, ID, required: false
      argument :name, String, required: true
      argument :address, String, required: true
      argument :consumer_id, ID, required: true
    end
  end
end
