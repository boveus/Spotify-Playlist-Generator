require 'yaml'
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

  def self.validate_spotify_auth_token_for(user)
    if Time.now > user.token_expiration
      encoded_id_secret = Base64.strict_encode64("#{ENV['spotify_key']}:#{ENV['spotify_secret']}")
      request = { :body => { "grant_type" => "refresh_token", "refresh_token" => user.refresh_token } ,
                       :headers => { "Authorization" => "Basic #{encoded_id_secret}" }
                     }
      response = HTTParty.post("https://accounts.spotify.com/api/token?refresh_token", request)
      User.update_yaml(response["access_token"], user.refresh_token)
      User.update(user.id, token: response["access_token"], token_expiration: (Time.now + response["expires_in"]))
    end
  end

  def self.update_yaml(token, refresh_token)
    yaml_file = Rails.root.join("config", "application.yml")
    yaml_info = YAML::load_file(yaml_file)
    yaml_info["token"] = token
    yaml_info["refresh_token"] = refresh_token
    File.write(yaml_file, yaml_info.to_yaml)
  end
end
