class Consumer < ApplicationRecord
  belongs_to :tenant
  def consumer_id
    id
  end
  has_many :consumer_outlets
end
