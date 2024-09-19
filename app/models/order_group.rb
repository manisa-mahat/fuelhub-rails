class OrderGroup < ApplicationRecord
  # Associations
  belongs_to :consumer
  belongs_to :tenant
  belongs_to :user

  has_one :delivery_order, dependent: :destroy
  has_many :line_items, through: :delivery_order

  accepts_nested_attributes_for :delivery_order, allow_destroy: true, reject_if: :all_blank
  validates :start_date, presence: true, if: :recurring?
  validates :end_date, presence: true, if: :recurring?
  validates :frequency, presence: true, if: :recurring?

  # Enums
  include OrderGroups::StatusEnum
end
