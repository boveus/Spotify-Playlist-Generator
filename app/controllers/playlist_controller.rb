class PlaylistController < ApplicationController
  before_action :authenticate_user!

  def create
    token = current_user.token
    query = query_params.to_h.symbolize_keys
    playlist_tracks = SpotifyService.new(token, query)
    .request_recommendations
  end

  def new
  end

  def add
    if seeds.uniq.length < 5
      seeds.append(artist_params[:artist_id])
    end
  end

  private
  def query_params
    params.permit(:acousticness, :danceability, :duration, :energy,
      :instrumentalness, :liveness, :loudness, :popularity, :limit)
  end

  def playlist_params
    params.permit(:playlist_name)
  end

  def artist_params
    params.permit(:artist_id)
  end
end
