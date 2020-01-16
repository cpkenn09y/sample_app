# This will guess the User class
FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "hello#{n}@gmail.com" }
  end
end
