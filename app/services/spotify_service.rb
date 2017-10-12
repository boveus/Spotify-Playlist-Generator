class SpotifyService
  def initialize(token, query = nil)
    @token = token
    @query = query
  end

  def request(api_path, token)
    HTTParty.get("https://api.spotify.com/v1/#{api_path}",
    headers: { "Authorization" => "Bearer #{token}"}).parsed_response
  end

  def request_with_query(api_path, token, query)
    headers =  { "Authorization" => "Bearer #{token}"}
    HTTParty.get("https://api.spotify.com/v1/#{api_path}",
    :query => query,
    :headers => headers).parsed_response
  end

  def request_user_top_tracks
    request("me/top/tracks", @token)
  end

  def request_user_top_artists
    request("me/top/artists", @token)
  end

  def request_recommendations
    request_with_query("recommendations", @token, @query)
  end

  def request_search
    request_with_query("search", @token, @query)
  end
end
