FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "someone#{n}@example.com" }
    password { 'password' }
  end
end
