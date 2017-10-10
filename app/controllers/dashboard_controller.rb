class DashboardController < ApplicationController
  def index
    top_artists = HTTParty.get("https://api.spotify.com/v1/me/top/artists",
    headers: { "Authorization" => "Bearer #{current_user.token}"}).parsed_response
    @top_artists = Artist.top_artists(top_artists)
  end
end
