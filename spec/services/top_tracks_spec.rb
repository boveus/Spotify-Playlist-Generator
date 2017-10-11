require 'rails_helper'

describe 'Top Tracks' do
  before do
    stub_request(:get, 'https://api.spotify.com/v1/me/top/artists')
    .to_return(body: fixture('top_artists.json'), headers: {content_type: 'application/json; charset=utf-8'})
    stub_request(:get, 'https://api.spotify.com/v1/me/top/tracks')
    .to_return(body: fixture('top_tracks.json'), headers: {content_type: 'application/json; charset=utf-8'})
  end
  it 'is instantiated with valid attributes' do
    @top_tracks_response = HTTParty.get("https://api.spotify.com/v1/me/top/tracks").parsed_response
    top_tracks = Track.top_tracks(@top_tracks_response)
    expect(top_tracks.first.artist).to eq('The Shaolin Afronauts')
    expect(top_tracks.first.name).to eq('Kilimanjaro')
    expect(top_tracks.first.image_path).to eq('https://i.scdn.co/image/0026d86ef0db6dad8b1dac0d4528063b34da4dfd')
    #embedded in album
    expect(top_tracks.first.track_id).to eq('6k6JSwl4Xs9goFC8VZ098l')
  end
end
