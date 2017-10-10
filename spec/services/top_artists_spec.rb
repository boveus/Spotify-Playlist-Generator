require 'rails_helper'

describe 'Top Artists' do
  it 'is instantiated with valid attributes' do
    VCR.use_cassette('Top Artists') do
      @top_artists_response = HTTParty.get("https://api.spotify.com/v1/me/top/artists",
      headers: { "Authorization" => "Bearer #{ENV["token"]}"}).parsed_response
    end
    top_artists = Artist.top_artists(@top_artists_response)
    expect(top_artists.first.name).to eq('Wax Tailor')
    expect(top_artists.first.image_path).to eq('https://i.scdn.co/image/aa4ee57fda8becb0e786de155577298980359bc7')
    expect(top_artists.first.genres).to eq(@top_artists_response["items"].first["genres"])
    expect(top_artists.first.artist_id).to eq('3qwxSif06Qwzykdln8ZGfG')
  end
end
