module ApplicationHelper

  def url_for(options = {})
    if @is_admin
      options = case options
      when String
        if options.index("token").nil?
          options + (options.index('?').nil? ? '?' : '&') + "token=#{Prediciendo::Application.config.secret_token}"
        end
      when Hash
        options.reverse_merge({:token => Prediciendo::Application.config.secret_token})
      else
        options
      end
    end 
    
    super
  end
  
  def twitter_image_path
    image_path("social/twitter.png")
  end
  
  def facebook_image_path
    image_path("social/facebook.png")
  end
  
  def email_image_path
    image_path("social/email.png")
  end
  
  def link_to_twitter
    link_to image_tag(twitter_image_path, :size => "20x20"), "https://twitter.com/prediciendo", :class => "twitter-follow-button", :title => "Seguir a @prediciendo en Twitter", :"data-show-count" => "false", :"data-lang" => "es", :rel => "nofollow" 
  end
  
end
