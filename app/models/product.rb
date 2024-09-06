class Product < ApplicationRecord
  include Products::Category
  include Products::Name
  include Products::Status
  include Products::Unit
end
