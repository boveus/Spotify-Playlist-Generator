require 'rails_helper'

describe 'Top Tracks' do
  it 'is instantiated with valid attributes' do
    @top_tracks_response = HTTParty.get("https://api.spotify.com/v1/me/top/tracks").parsed_response
    top_tracks = TrackSearch.new(@top_tracks_response).top_tracks
    expect(top_tracks.first.artist).to eq('The Shaolin Afronauts')
    expect(top_tracks.first.name).to eq('Kilimanjaro')
    expect(top_tracks.first.image_path).to eq('https://i.scdn.co/image/0026d86ef0db6dad8b1dac0d4528063b34da4dfd')
    expect(top_tracks.first.track_id).to eq('6k6JSwl4Xs9goFC8VZ098l')
  end
end
