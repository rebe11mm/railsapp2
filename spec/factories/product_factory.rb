FactoryGirl.define do

  sequence(:id) { |n| "#{n}" }

  factory :product do
    name "Generated shoe"
    price "25.99"
  end
end