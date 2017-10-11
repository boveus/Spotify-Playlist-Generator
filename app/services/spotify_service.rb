class SpotifyService
  def initialize
  end

  def request(api_path, token)
    HTTParty.get("https://api.spotify.com/v1/#{api_path}",
    headers: { "Authorization" => "Bearer #{token}"}).parsed_response
  end
end
