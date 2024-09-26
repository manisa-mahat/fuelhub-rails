class ChildGroup < ApplicationRecord
  belongs_to :order_group
  belongs_to :consumer
  belongs_to :user
  belongs_to :tenant
  has_one :delivery_order, dependent: :destroy
  has_many :line_items, through: :delivery_order, dependent: :destroy
  accepts_nested_attributes_for :delivery_order, allow_destroy: true, reject_if: :all_blank
end
