class Task < ActiveRecord::Base
  has_many :tickets
  
  validates :name, :presence => true
  
  before_save :default_values
  
  def default_values
    self.budget = 0 unless self.budget
    self.cost = 0 unless self.cost
  end
end
