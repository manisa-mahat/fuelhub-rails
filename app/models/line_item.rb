class LineItem < ApplicationRecord
  # Associations
  belongs_to :delivery_order
  belongs_to :product
  has_one :order_group, through: :delivery_order
  has_one :child_group, through: :delivery_order

  # Enums
  include LineItems::StatusEnum

  # Validations
  validates :product_id, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
