class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  belongs_to :comment, :foreign_key => :parent_id, optional: true
  has_many :replies, :foreign_key => :parent_id, :class_name => 'Comment', :dependent => :destroy
end