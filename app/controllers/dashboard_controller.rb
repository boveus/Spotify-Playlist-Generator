class DashboardController < ApplicationController
  def index
    token = current_user.token
    top_artists_raw = SpotifyService.new(token).request_user_top_artists
    top_tracks_raw = SpotifyService.new(token).request_user_top_tracks
    @top_artists = ArtistSearch.new(top_artists_raw).top_artists
    @top_tracks = TrackSearch.new(top_tracks_raw).top_tracks
  end

  def create_playlist
  end
end
