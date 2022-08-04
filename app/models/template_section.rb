class TemplateSection < ActiveRecord::Base
  belongs_to :template
  has_many :comments, as: :commentable, dependent: :destroy
  has_one :content, dependent: :destroy
end