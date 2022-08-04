class Content < ActiveRecord::Base
  has_many :attachments, as: :attachmentable, dependent: :destroy
  belongs_to :template_section
end