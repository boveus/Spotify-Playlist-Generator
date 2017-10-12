feature "An authenticated user can create artist seeds to make a playlist" do
  it "allows users to enter a search term for a particular artist
  and select one or more artists from the search results" do

  visit spotify_login_path

  click_on 'Create Playlist'

  expect(page).to have_css("#spotify_search")

  fill_in "Search for artist, album, or song:", :with => 'Michael Jackson'
  click_on "Search Spotify"

  expect(current_path).to eq('/dashboard/create_playlist/choose_seeds')

  expect(page).to have_content("Michael Jackson")

  select("Michael Jackson")

  click_on "Submit Choices"

  expect(current_path).to eq(create_playlist_path)
  end
end
