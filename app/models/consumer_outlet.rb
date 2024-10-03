class ConsumerOutlet < ApplicationRecord
  belongs_to :consumer
  acts_as_tenant(:tenant)
end
