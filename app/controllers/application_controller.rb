class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def authenticate
    redirect_to login_path unless current_user
  end

end
