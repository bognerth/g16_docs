class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
     
  end
  helper_method :current_user

  def authorize
    redirect_to ENV['LOGIN_DOMAIN'], alert: "#{current_user.inspect}Dokumente Autorisierung fehlgeschlagen. Loggen Sie sich mit der G16-Kennung und Passwort ein. User: #{session[:user_id]}" if current_user.nil?
  end
end
