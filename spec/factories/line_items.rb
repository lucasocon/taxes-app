FactoryGirl.define do
  factory :line_item do
    order
    product
    quantity 1
    price "0.00"
  end
end
