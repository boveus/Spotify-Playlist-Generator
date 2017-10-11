class PlaylistController < ApplicationController
  def create
    token = current_user.token
    query = query_params.to_h.symbolize_keys
    playlist_tracks = SpotifyService.new(token, query)
    .request_recommendations
    binding.pry
  end

# GET https://api.spotify.com/v1/recommendations

  def new
  end

  private
  def query_params
    params.permit(:acousticness, :danceability, :duration, :energy,
      :instrumentalness, :key, :liveness, :loudness, :mode,
      :popularity, :limit)
  end

  def playlist_params
    params.permit(:playlist_name)
  end
end
