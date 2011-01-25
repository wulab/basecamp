class Ticket < ActiveRecord::Base
  belongs_to :task
  has_many :comments, :as => :commentable

  validates :name, :presence => true
  
  before_save :default_values
  
  def default_values
    self.opened_by = 'anonymous' unless self.opened_by.present?
    self.status = 'Open' unless self.status.present?
  end
end
