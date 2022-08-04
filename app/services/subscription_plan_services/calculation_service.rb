module SubscriptionPlanServices
  class CalculationService
    def initialize(account:, subscription_plan:)
      @account = account
      @subscription_plan = subscription_plan
    end

    def calculate_price
      number_of_users = @account.users.length
      number_of_extra_users = [number_of_users - @subscription_plan.max_users, 0].max
      price_of_extra_users = number_of_extra_users * @subscription_plan.price_per_user_month
      monthy_price = @subscription_plan.price_per_month + price_of_extra_users
      yearly_price = @subscription_plan.price_per_year + price_of_extra_users * 12
      return {monthly_plan: monthy_price.round(2).to_f, yearly_plan: yearly_price.round(2).to_f}
     end
  end
end