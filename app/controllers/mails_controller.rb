class MailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    mail = Mail.new
    mail.result = params.as_json
    mail.save
    render nothing: true
  end
  
end