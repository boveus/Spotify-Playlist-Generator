class SessionsController < ApplicationController
  def create
    session[:user_id] = User.create_from_request(request.env)
    binding.pry
    redirect_to dashboard_index_path
  end
end
