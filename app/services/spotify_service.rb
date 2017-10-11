class SpotifyService
  def initialize(token)
    @token = token
  end

  def request(api_path, token)
    HTTParty.get("https://api.spotify.com/#{api_path}",
    headers: { "Authorization" => "Bearer #{token}"}).parsed_response
  end

  def request_user_top_tracks
    request("v1/me/top/tracks", @token)
  end

  def request_user_top_artists
    request("v1/me/top/artists", @token)
  end
end
