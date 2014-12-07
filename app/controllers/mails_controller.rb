class MailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    render :text => params.as_json
  end
  
end