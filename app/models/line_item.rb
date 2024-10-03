class LineItem < ApplicationRecord
  acts_as_tenant(:tenant)
  # Associations
  belongs_to :delivery_order
  belongs_to :product

  # Enums
  include LineItems::StatusEnum

  # Validations
  validates :product_id, presence: true
end
