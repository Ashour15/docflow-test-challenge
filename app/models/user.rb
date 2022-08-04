class User < ActiveRecord::Base
  has_many :accounts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :templates, dependent: :destroy
end