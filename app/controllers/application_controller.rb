class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_role, :grant, :current_tab
  
  def set_role
    @is_admin = params[:token].present? && params[:token] == Prediciendo::Application.config.secret_token
  end
  
  def grant
    not_found unless is_granted? || params[:controller] == "mails"
  end
  
  def current_tab
    @is_pending_predictions_list = params[:controller] == "predictions" && !params[:completed].present?
    @is_completed_predictions_list = params[:controller] == "predictions" && params[:completed].present? && params[:completed] == "true"
    @is_ranking_list = params[:controller] == "authors" && params[:action] == "index"
  end
  
  def not_found
    raise ActionController::RoutingError.new('No tiene permiso para realizar esta operación')
  end
  
  private
  
  def is_granted?
    ["show", "index"].include?(params[:action]) || (["new", "edit", "create", "update", "destroy"].include?(params[:action]) && @is_admin == true)
  end
  
end
