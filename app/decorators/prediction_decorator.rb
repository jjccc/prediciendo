class PredictionDecorator < Draper::Decorator
  delegate_all
  
  def author
    object.author.name
  end
  
  def author_title
    object.author.title
  end
  
  def has_author_title
    !object.author.title.blank?
  end
  
  def image
    author = object.author
    author.has_image? ? author.image_path : "/images/trecet.jpeg"
  end
  
  def due_date
    h.time_ago_in_words(object.due_date)
  end
  
  def background_class
    if object.is_pending
      ""
    else
      is_success ? "bg-success" : "bg-danger"
    end
  end
  
  def author_link
    h.author_path(object.author_id)
  end
  
  def edit_path
    h.edit_prediction_path(object.id)
  end
  
  def delete_path
    h.prediction_path(object.id, :method => :delete)
  end
  
  def is_admin
    self.context[:is_admin]
  end
  
  def twitter_icon
    h.twitter_image_path
  end
  
  def facebook_icon
    h.facebook_image_path
  end
  
  def email_icon
    h.email_image_path
  end
  
  def url
    h.prediction_url(prediction.id)
  end
  
  def tweet
    "Conoce la predicción de #{self.author} "  
  end

end
