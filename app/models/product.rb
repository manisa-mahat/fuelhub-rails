class Product < ApplicationRecord
  include Products::Category
  include Products::Name
  include Products::Status
  include Products::Unit

  belongs_to :user
  acts_as_tenant(:tenant)
end
