class OrganisationAccount < Account
  has_many :account_users, class_name: 'AccountUser', foreign_key: 'account_id'
  has_many :users, through: :account_users
end