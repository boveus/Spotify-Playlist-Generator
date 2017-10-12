feature "An authenticated user can create artist seeds to make a playlist" do
  it "allows users to enter a search term for a particular artist
  and select one or more artists from the search results" do

  visit spotify_login_path

  click_on 'Search Spotify'

  expect(page).to have_css("#spotify_search")

  fill_in "Search for artist, album, or song:", :with => 'Michael Jackson'

  click_button "Search"

  expect(page).to have_content("Michael Jackson")

  click_on('Add Artist To List', match: :first)

  expect(current_path).to eq(choose_seeds_path)
  end
end
