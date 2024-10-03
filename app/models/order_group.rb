class OrderGroup < ApplicationRecord
  acts_as_tenant(:tenant)
  # Associations
  belongs_to :consumer
  belongs_to :user
  has_one :delivery_order, dependent: :destroy

  belongs_to :parent_order, class_name: "OrderGroup", optional: true
  has_many :child_orders, class_name: "OrderGroup", foreign_key: "parent_order_id", dependent: :destroy


  # Nested Attributes
  accepts_nested_attributes_for :delivery_order, allow_destroy: true, reject_if: :all_blank

  # Validations
  validates :start_date, presence: true, if: :recurring?
  validates :end_date, presence: true, if: :recurring?
  validates :frequency, presence: true, if: :recurring?

  # Enums
  include OrderGroups::StatusEnum
end
