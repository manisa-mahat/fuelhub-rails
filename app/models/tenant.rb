class Tenant < ApplicationRecord
  has_many :users
  has_many :consumers
end
