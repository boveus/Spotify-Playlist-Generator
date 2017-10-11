class DashboardController < ApplicationController
  def index
    token = current_user.token
    top_artists = SpotifyService.new.request("me/top/artists", token)
    top_tracks = SpotifyService.new.request("me/top/tracks", token)
    @top_artists = Artist.top_artists(top_artists)
    @top_tracks = Track.top_tracks(top_tracks)
  end
end
