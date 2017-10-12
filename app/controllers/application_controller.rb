class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :seeds

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def seeds
    @seeds ||= session[:seeds]
  end

  private
  def authenticate_user!
    redirect_to :root if current_user.nil?
  end
end
