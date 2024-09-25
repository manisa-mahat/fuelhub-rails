class Tenant < ApplicationRecord
  has_many :users
  has_many :resources
  has_many :consumers
  has_many :products
  has_many :orders_groups
end
