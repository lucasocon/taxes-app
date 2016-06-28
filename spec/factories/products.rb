FactoryGirl.define do
  factory :product do
    product_type
    name "MyString"
    price "9.99"
    imported false
  end
end
