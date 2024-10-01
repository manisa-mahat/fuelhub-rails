class DeliveryOrder < ApplicationRecord
  # Associations
  belongs_to :order_group
  belongs_to :child_group, optional: true
  belongs_to :consumer_outlet
  has_many :line_items, dependent: :destroy
  # belongs_to :resource

  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: :all_blank

  # Validations
  validates :planned_at, :consumer_outlet_id, presence: true
end
