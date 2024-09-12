class Driver < ApplicationRecord
  belongs_to :tenant_id
  belongs_to :user_id
end
class Driver < ApplicationRecord
  # Associations
  belongs_to :tenant
  belongs_to :user

  # Enums
  include Drivers::DriverStatusEnum

  # Validations
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :status, presence: true
end
