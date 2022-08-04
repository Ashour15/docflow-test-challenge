FactoryBot.define do
  factory :subscription_plan do
    name { "SubscriptionPlan1" }
    max_templates { 0 }
    price_per_month { 20.0 }
    price_per_year { 216.0 }
    price_per_user_month { 7.0 }
    
  end
end
