class User < ApplicationRecord
  def super_admin?
    role == "super_admin"
  end
end
