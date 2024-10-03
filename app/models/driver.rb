class Driver < ApplicationRecord
  # Associations
  acts_as_tenant(:tenant)
  belongs_to :user

  # Enums
  include Drivers::StatusEnum

  # Validations
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :status, presence: true
end
