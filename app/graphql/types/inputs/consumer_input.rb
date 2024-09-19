module Types
  module Inputs
    class ConsumerInput < BaseInputObject
      argument :name, String, required: true
      argument :address, String, required: true
      argument :email, String, required: true
      argument :phone_number, String, required: true
    end
  end
end
