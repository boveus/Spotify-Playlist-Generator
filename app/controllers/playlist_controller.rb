class PlaylistController < ApplicationController
  def create
    binding.pry
  end

  def new
  end

  private
  def playlist_params
    params.permit(:acousticness, :danceability, :duration, :energy,
      :instrumentalness, :key, :liveness, :loudness, :mode,
      :popularity, :playlist_name, :number_of_songs)
  end
end
