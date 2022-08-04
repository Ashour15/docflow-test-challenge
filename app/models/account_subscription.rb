class AccountSubscription < ActiveRecord::Base
  belongs_to :account
  belongs_to :subscription_plan
  
end