class Resource < ApplicationRecord
  # Associations
  belongs_to :user
  acts_as_tenant(:tenant)

  # Enums for asset category and status
  include Resources::ResourceCategoryEnum
  include Resources::ResourceStatusEnum

  # Validations
  # validates :resource_id, presence: true, uniqueness: true
  # validates :resource_category, inclusion: { in: Resources::ResourceCategoryEnum::CATEGORY.values }
  # validates :resource_status, inclusion: { in: Resources::ResourceStatusEnum::STATUS.values }
end
