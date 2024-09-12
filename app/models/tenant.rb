<<<<<<< HEAD
class Tenant < ApplicationRecord
  has_many :users
end
=======
class Tenant < ApplicationRecord
  has_many :users
  has_many :resources
  has_many :consumers
  has_many :products
end
>>>>>>> 705db1a262ae5ebe02ecb1e36d2123808908c651
