class Ticket < ActiveRecord::Base
  has_many :comments, :as => :commentable

  validates :name, :presence => true
  
  before_save :default_values
  
  def default_values
    self.status = 'Open' unless self.status
  end
end
