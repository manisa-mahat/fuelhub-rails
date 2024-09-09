class Tenant < ApplicationRecord
  has_many :users
  has_many :resources
end
