class Consumer < ApplicationRecord
  belongs_to :tenant
  has_many :consumer_outlets
  validates :email, uniqueness: { message: "Email has already taken." }
  validates :phone_number, uniqueness: { message: "Phone Number already used." }
end
