class OrderGroup < ApplicationRecord
  # Associations
  belongs_to :consumer
  acts_as_tenant(:tenant)
  belongs_to :user
  has_one :delivery_order, dependent: :destroy
  has_many :line_items, through: :delivery_order, dependent: :destroy
  has_many :child_groups, dependent: :destroy

  # Nested Attributes
  accepts_nested_attributes_for :delivery_order, allow_destroy: true, reject_if: :all_blank

  # Validations
  validates :start_date, presence: true, if: :recurring?
  validates :end_date, presence: true, if: :recurring?
  validates :frequency, presence: true, if: :recurring?

  # Enums
  include OrderGroups::StatusEnum
end
