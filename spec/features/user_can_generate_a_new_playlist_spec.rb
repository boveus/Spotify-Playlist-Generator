require 'rails_helper'

feature "An authenticated user can view their dashboard" do
  it "displays sliders to adjust various attributes of songs,
  a field to enter a playlist name, a field to enter number of songs,
  and a submit button" do

  visit create_playlist_path

  expect(page).to have_css('#acousticness_slider')
  expect(page).to have_css('#danceability_slider')
  expect(page).to have_css('#duration_ms_slider')
  expect(page).to have_css('#energy_slider')
  expect(page).to have_css('#instrumentalness_slider')
  expect(page).to have_css('#key_slider')
  expect(page).to have_css('#liveness_slider')
  expect(page).to have_css('#loudness_slider')
  expect(page).to have_css('#mode_slider')
  expect(page).to have_css('#popularity_slider')
  expect(page).to have_css('#playlist_name_field')
  expect(page).to have_css('#number_of_songs_field')
  expect(page).to have_button('Generate Playlist')
  end
end
