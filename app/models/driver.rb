class Driver < ApplicationRecord
  belongs_to :tenant_id
  belongs_to :user_id
end
