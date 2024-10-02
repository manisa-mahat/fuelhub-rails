FactoryBot.define do
  factory :product do
    name { 'Petrol' }
    category { 'fuel' }
    status { 'available' }
    unit { 'litre' }
  end
end
