<<<<<<< HEAD
class Product < ApplicationRecord
  include Products::Category
  include Products::Name
  include Products::Status
  include Products::Unit
end
=======
class Product < ApplicationRecord
  include Products::Category
  include Products::Name
  include Products::Status
  include Products::Unit

  belongs_to :user
  acts_as_tenant(:tenant)
end
>>>>>>> 705db1a262ae5ebe02ecb1e36d2123808908c651
