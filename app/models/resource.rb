class Resource < ApplicationRecord
  # Associations
  belongs_to :user
  acts_as_tenant(:tenant)
  has_many :delivery_orders

  # Enums for asset category and status
  include Resources::ResourceCategoryEnum
  include Resources::ResourceStatusEnum
  include Resources::ResourceUnitEnum

  validates :vehicle_id, uniqueness: { message: "Vehicle already exist with this id." }

  validate :name_must_not_contain_spaces
  validate :no_space_validation_in_vehicle_id

  private

  def name_must_not_contain_spaces
    if name.present? && name.match?(/\s/)
      errors.add(:name, "must not contain spaces.")
    end
  end

  def no_space_validation_in_vehicle_id
    if vehicle_id.present? && vehicle_id.match?(/\s/)
      errors.add(:vehicle_id, "must not contain spaces.")
    end
  end
end
