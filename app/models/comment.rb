class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  
  validates :description, :presence => true
end
