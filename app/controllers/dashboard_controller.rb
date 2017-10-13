class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    token = current_user.token
  end

  def top_artists
    top_artists_raw = SpotifyService.new(token).request_user_top_artists
    @top_artists = ArtistSearch.new(top_artists_raw).top_artists
  end

  def top_tracks
    top_tracks_raw = SpotifyService.new(token).request_user_top_tracks
    @top_tracks = TrackSearch.new(top_tracks_raw).top_tracks
  end

  def logout
    reset_session
    redirect_to :root
  end
end
