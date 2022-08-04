class Content < ActiveRecord::Base
  has_many :attachments, as: :attachmentable, dependent: :destroy
end