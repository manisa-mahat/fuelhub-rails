class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :jwt_authenticatable,
         jwt_revocation_strategy: self
  acts_as_tenant(:tenant)
  ROLES = %w[user admin].freeze
  validates :role, inclusion: { in: ROLES }
  validates :email, uniqueness: { scope: :role }
  validates :password, presence: true, length: { minimum: 6 }
end
