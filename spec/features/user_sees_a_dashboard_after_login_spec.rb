require 'rails_helper'

feature "An authenticated user can view their dashboard" do
  before do
    stub_request(:get, 'https://api.spotify.com/v1/me/top/artists')
    .to_return(body: fixture('top_artists.json'), headers: {content_type: 'application/json; charset=utf-8'})
    stub_request(:get, 'https://api.spotify.com/v1/me/top/tracks')
    .to_return(body: fixture('top_tracks.json'), headers: {content_type: 'application/json; charset=utf-8'})
  end
  it "displays top 20 artists, top 20 tracks for a user,
  provides and links to playlist creation" do
  visit spotify_login_path

  expect(current_path).to eq(dashboard_index_path)
  expect(page).to have_css('#top_artist_1')
  expect(page).to have_css('.top_artist')
  expect(page).to have_css('.top_track')
  expect(page).to have_css('#top_track_7')
  expect(page).to have_link('Create Playlist')
  end
end
