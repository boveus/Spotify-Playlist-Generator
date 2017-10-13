class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :seeds
  helper_method :validate_current_user_auth_token

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def token
    current_user.token
  end

  def seeds
    @seeds ||= session[:seeds]
  end

  private
  def authenticate_user!
    redirect_to :root if current_user.nil?
  end

  def validate_current_user_auth_token
    if Time.now > current_user.token_expiration.to_i
      encoded_id_secret = Base64.strict_encode64("#{ENV['spotify_key']}:#{ENV['spotify_secret']}")
      request = { :body => { "grant_type" => "refresh_token", "refresh_token" => current_user.refresh_token } ,
                       :headers => { "Authorization" => "Basic #{encoded_id_secret}" }
                     }
      response = HTTParty.post("https://accounts.spotify.com/api/token?refresh_token", request)
      User.update(current_user.id, token: response["access_token"], token_expiration: (Time.now + response["expires_in"]))
    end
  end
end
