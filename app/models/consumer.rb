class Consumer < ApplicationRecord
  belongs_to :tenant
  has_many :consumer_outlets
  def consumer_id
    id
  end
end
