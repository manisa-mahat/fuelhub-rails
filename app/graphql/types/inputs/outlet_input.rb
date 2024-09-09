module Types
  module Inputs
    class OutletInput < BaseInputObject
      argument :name, String, required: true
      argument :address, String, required: true
    end
  end
end
