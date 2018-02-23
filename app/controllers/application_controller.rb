class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :not_found

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def not_found
      render template: '/home/not_found'
  end

end
