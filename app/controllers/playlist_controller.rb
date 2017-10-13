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

  def remove
    seeds.delete_at(params["index"].to_i)
    redirect_to root_path
    flash[:notice] = "Seed successfully removed."
  end

  def add
    if seeds.include?(seed_params)
      flash[:notice] =  "You've already added #{seed_params["name"]}"
    elsif seeds.uniq.length < 5
      seeds.append(seed_params.to_h)
      flash[:notice] =  "Successfully added #{seed_params["name"]}"
    else
      flash[:error] = "You can only have five items in your seed list."
    end
    redirect_to root_path
  end

  private
  def query_params
    params.permit(:acousticness, :danceability, :duration, :energy,
      :instrumentalness, :liveness, :loudness, :popularity, :limit)
  end

  def playlist_params
    params.permit(:playlist_name)
  end

  def seed_params
    params.permit(:name, :image_path, :seed, :type)
  end
end
