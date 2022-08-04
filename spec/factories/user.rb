FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Person#{n}" }
  end
end
