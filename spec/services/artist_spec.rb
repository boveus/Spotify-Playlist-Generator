require 'rails_helper'

describe 'Top Artists' do
  it 'is instantiated with valid attributes' do
    VCR.use_cassette('Top Artists') do
      @top_artists_response = HTTParty.get("https://api.spotify.com/v1/me/top/artists",
      headers: { "Authorization" => "Bearer #{ENV["token"]}"}).parsed_response
    end
    binding.pry
    artist = TopArtists.new(@top_artists_response)
    expect(TopArtists.name).to eq('Wax Tailor')
    expect(TopArtists.image_path).to eq('https://i.scdn.co/image/aa4ee57fda8becb0e786de155577298980359bc7')
    expect(TopArtists.genres).to eq(genres)
    expect(TopArtists.artist_id).to eq('3qwxSif06Qwzykdln8ZGfG')
  end
end
