class Consumer < ApplicationRecord
  belongs_to :tenant
  def consumer_id
    id
  end
end
