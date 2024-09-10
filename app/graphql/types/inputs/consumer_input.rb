module Types
  module Inputs
    class ConsumerInput < BaseInputObject
      argument :name, String, required: true
    end
  end
end
