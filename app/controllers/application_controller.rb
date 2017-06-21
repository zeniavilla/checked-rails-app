class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_team
  
  def current_user
        @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_team
      current_user.team
  end
end
