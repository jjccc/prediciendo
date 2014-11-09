class Prediction < ActiveRecord::Base
  attr_accessor :status
  attr_accessible :author_id, :description, :due_date, :is_pending, :is_success, :result, :status
  
  belongs_to :author
  
  before_save :close
  after_commit :refresh_author
  
  paginates_per 5
  
  def close
    unless self.status.blank?
      self.is_pending = false
      self.is_success = (self.status == "success")
      self.result = nil if self.is_success
    end
  end
  
  def refresh_author
    self.author.refresh
  end
  
end
