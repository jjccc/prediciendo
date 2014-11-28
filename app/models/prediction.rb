class Prediction < ActiveRecord::Base
  extend FriendlyId
  friendly_id :tag, use: :slugged
  
  attr_accessor :status
  attr_accessible :author_id, :description, :due_date, :is_pending, :is_success, :result, :status, :tag
  
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
  
  def self.filter(is_pending_predictions_list, sort, page, search)
    order_by = (sort.nil? || sort == "creation_date") ? "created_at desc" : "due_date, created_at desc"
    if search.blank?
      Prediction.where(:is_pending => is_pending_predictions_list).
                 order(order_by).
                 page(page)
    else
      Prediction.joins(:author).where(:is_pending => is_pending_predictions_list).
                 where("(predictions.description ilike ?) or (authors.title ilike ?) or (authors.name ilike ?)", "%#{search}%", "%#{search}%", "%#{search}%").
                 order(order_by).
                 page(page)
    end
  end
  
end
