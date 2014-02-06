class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "get stuffed, hackerzzzz"
  end


  helper_method :current_user
  

  private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session.delete(:user_id)
    return nil
  end
  end

  def current_song
    @song
  end


  def logged_in?
    !!current_user
  end

end
