class Tenant < ApplicationRecord
  has_many :users
  has_many :resources
  has_many :consumers
end
