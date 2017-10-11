class DashboardController < ApplicationController
  def index
    token = current_user.token
    top_artists_raw = SpotifyService.new.request("me/top/artists", token)
    top_tracks = SpotifyService.new.request("me/top/tracks", token)
    @top_artists = ArtistSearch.new(top_artists_raw).top_artists
    @top_tracks = TrackSearch.new(top_tracks).top_tracks
  end
end
