class Ticket < ActiveRecord::Base
  before_save :default_values
  
  validates :name, :presence => true
  
  def default_values
    self.status = 'Open' unless self.status
  end
end
