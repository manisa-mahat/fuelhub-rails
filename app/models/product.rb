class Product < ApplicationRecord
  include Products::Category
  include Products::Status
  include Products::Unit

  belongs_to :user
  acts_as_tenant(:tenant)
  has_many :line_items

  validates :name, uniqueness: { message: "Product already exist." }
  validate :name_must_not_contain_spaces

  private

  def name_must_not_contain_spaces
    if name.present? && name.match?(/\s/)
      errors.add(:name, "must not contain spaces.")
    end
  end
end
