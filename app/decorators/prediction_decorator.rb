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
    dd = h.time_ago_in_words(object.due_date)
    if is_waiting_for_confirmation == true
      dd = dd.gsub("Faltan", "Hace").gsub("Falta", "Hace")  if is_waiting_for_confirmation == true
      dd = "#{dd}. Esperando confirmación"
    end
    dd
  end
  
  def background_class
    if object.is_pending
      is_waiting_for_confirmation ? "bg-warning" : ""
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
    h.prediction_url(prediction)
  end
  
  def tweet
    "Conoce la predicción de #{self.author} "  
  end
  
  def is_waiting_for_confirmation
    object.due_date < Date.today && object.is_pending == true
  end
  
  def result_class
    object.is_success ? "text-success" : "text-danger"
  end

end
