class LineItem < ApplicationRecord
  # Associations
  belongs_to :delivery_order

  # Enums
  include LineItems::StatusEnum

  # Validations
  validates :name, :quantity, :unit, :status, presence: true
  # validates :status, inclusion: { in: statuses.keys }
end
