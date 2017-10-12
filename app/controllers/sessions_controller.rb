class SessionsController < ApplicationController
  def create
    session[:user_id] = User.find_or_create_from_request(request.env)
    session[:seeds] = []
    redirect_to dashboard_index_path
  end
end
