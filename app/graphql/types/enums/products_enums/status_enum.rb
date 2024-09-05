module Types
  module Enums
    module ProductsEnums
      class StatusEnum < BaseEnum
        ::Products::Status::STATUS.each do |name, value|
          value(name, value)
        end
      end
    end
  end
end
