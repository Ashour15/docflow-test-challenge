require 'rails_helper'

describe ".calculate_price" do
  context "when account users number exceeds plan limit" do
    it "calculates the basic price plus extra fees " do
      users = build_list(:user, 20)
      account = build(:organisation_account)
      account.user = users.first
      account.users << users
      subscription_plan = build(:subscription_plan, max_users: 5)
      total_price = SubscriptionPlanServices::CalculationService.new(account: account, subscription_plan: subscription_plan).calculate_price
      expect(total_price).to eq({monthly_plan: 125.0, yearly_plan: 1476.0})
    end
  end

  context "when account users number is less than plan limit" do
    it "calculates the price of a subscription plan with maximum number of users" do
      users = build_list(:user, 2)
      account = build(:organisation_account)
      account.user = users.first
      account.users << users
      subscription_plan = build(:subscription_plan, max_users: 5)
      total_price = SubscriptionPlanServices::CalculationService.new(account: account, subscription_plan: subscription_plan).calculate_price
      expect(total_price).to eq({monthly_plan: 20.0, yearly_plan: 216.0})
    end
  end

  context "when account users number is equal to plan limit" do
    it "calculates the price of a subscription plan with maximum number of users" do
      users = build_list(:user, 5)
      account = build(:organisation_account)
      account.user = users.first
      account.users << users
      subscription_plan = build(:subscription_plan, max_users: 5)
      total_price = SubscriptionPlanServices::CalculationService.new(account: account, subscription_plan: subscription_plan).calculate_price
      expect(total_price).to eq({monthly_plan: 20.0, yearly_plan: 216.0})
    end
  end
end