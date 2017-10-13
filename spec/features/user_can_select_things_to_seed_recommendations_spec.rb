feature "An authenticated user can create artist seeds to make a playlist" do
  it "allows users to enter a search term for a particular artist
  and select one or more artists from the search results" do

  visit spotify_login_path

  click_on 'Search Spotify'

  expect(page).to have_css("#spotify_search")

  fill_in "Search for artist or song:", :with => 'Michael Jackson'

  click_button "Search"

  expect(page).to have_content("Michael Jackson")

  click_on("Add Artist To List", match: :first)
  # click_on("#top_artist_2")

  expect(current_path).to eq(root_path)

  expect(page).to have_content("1) Artist - Michael Jackson")
  # expect(page).to have_content("2) Artist - Jackson Michael")
  end
end
