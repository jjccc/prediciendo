class AuthorDecorator < Draper::Decorator
  delegate_all
  
  def has_author_title
    !object.title.blank?
  end
  
  def performance
    "#{object.performance.round.to_s}%"
  end
  
  def image
    object.has_image? ? object.image_path : "/images/trecet.jpeg"
  end
  
  def successes
    s = object.successes.to_s
    object.successes == 1 ? "#{s} acierto" : "#{s} aciertos"
  end
  
  def mistakes
    m = object.mistakes.to_s
    m == 1 ? "#{m} fallo" : "#{m} fallos"
  end
  
  def attempts
    a = object.attempts.to_s
    object.attempts == 1 ? "#{a} predicción" : "#{a} predicciones"
  end
  
  def link
    h.author_path(object.id)
  end
  
  def is_clickable
    context[:is_clickable].nil? || context[:is_clickable] == true
  end
  
    def edit_path
    h.edit_author_path(object.id)
  end
  
  def delete_path
    h.author_path(object.id, :method => :delete)
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
    h.author_url(object.id)
  end
  
  def tweet
    "Conoce todas las predicciones de #{object.name} "  
  end


end
