module ApplicationHelper

  def url_for(options = {})
    if @is_admin
      options = case options
      when String
        if options.index("token").nil?
          options + (options.index('?').nil? ? '?' : '&') + "token=soyelcreadorytengopermisoparatodo"
        end
      when Hash
        options.reverse_merge({:token => "soyelcreadorytengopermisoparatodo"})
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
  
end
