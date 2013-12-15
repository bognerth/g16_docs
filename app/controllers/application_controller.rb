class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
     
  end
  helper_method :current_user

  def authorize
    redirect_to ENV['ROOT_DOMAIN'], alert: "Loggen Sie sich mit der G16-Kennung und Passwort ein." if current_user.nil?
  end
end
