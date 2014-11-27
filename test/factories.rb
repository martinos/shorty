require 'factory_girl'

FactoryGirl.define do
  sequence :email do |n|
    "mail#{n}@example.com"
  end

  sequence :password do |n|
    "longsecret#{n}"
  end

  factory :user do|f|
    email
    password
  end

  factory :address do
  end
end
