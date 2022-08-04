class Invoice < ActiveRecord::Base
  belongs_to :account
  belongs_to :account_subscription
  

end