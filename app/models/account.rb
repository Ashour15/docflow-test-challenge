class Account < ActiveRecord::Base
  belongs_to :user
  has_many :subscriptions, class_name: 'AccountSubscription', dependent: :destroy
  # has_one :current_subscription, { :class_name => 'AccountSubscription',
  #   :order => 'id desc' }
end