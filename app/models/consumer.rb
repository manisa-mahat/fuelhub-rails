class Consumer < ApplicationRecord
  belongs_to :tenant
  has_many :consumer_outlets
  has_many :consumer_outlets
end
