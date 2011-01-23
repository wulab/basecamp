class Task < ActiveRecord::Base
  has_many :tickets
  
  validates :name, :presence => true
  validates :name, :uniqueness => true
end
