class Template < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  has_many :template_sections, dependent: :destroy
end