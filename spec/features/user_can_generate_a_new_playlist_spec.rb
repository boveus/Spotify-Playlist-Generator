require 'rails_helper'

feature "An authenticated user can create a playlist" do
  xit "displays sliders to adjust various attributes of songs,
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

  xit "when a user clicks on the generate playlist button it
  redirects a the user to a success screen and links to
  their playlist" do
  visit spotify_login_path

  click_on 'Create Playlist'

  fill_in 'acousticness_slider', :with => 36
  fill_in 'danceability_slider', :with => 73
  fill_in 'duration_ms_slider', :with => 20
  fill_in 'energy_slider', :with => 99
  fill_in 'instrumentalness_slider', :with => 20
  fill_in 'key_slider', :with => 76
  fill_in 'liveness_slider', :with => 1
  fill_in 'loudness_slider', :with => 99
  fill_in 'mode_slider', :with => 34
  fill_in 'popularity_slider', :with => 8
  fill_in 'playlist_name_field', :with => 'my playlist'
  fill_in 'number_of_songs_field', :with => 15

  click_on('Generate Playlist')
  end
end
