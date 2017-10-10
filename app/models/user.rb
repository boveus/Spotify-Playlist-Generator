class User < ApplicationRecord

  def self.find_or_create_from_request(request)
    user = User.find_or_create_by(uid: request["omniauth.auth"]["uid"])
    info = request["omniauth.auth"]["info"]
    user.name = info["name"]
    user.email = info["email"]
    user.image_path = info["image"]
    credentials = request["omniauth.auth"]["credentials"]
    user.token = credentials["token"]
    user.refresh_token = credentials["refresh_token"]
    user.token_expiration = credentials["expires_at"]
    user.save
    user.id
  end
end
