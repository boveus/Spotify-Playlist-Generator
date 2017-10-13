feature "An authenticated user can create artist seeds to make a playlist" do
  it "allows users to enter a search term for a particular artist
  and select one or more artists from the search results" do

  visit spotify_login_path

  click_on 'Search Spotify'

  expect(page).to have_css("#spotify_search")

  fill_in "Search for artist, album, or song:", :with => 'Michael Jackson'

  click_button "Search"

  expect(page).to have_content("Michael Jackson")

  within page.all('.button_to')[0] do
    click_on 'Add Artist To List'
  end
  within page.all('.button_to')[1] do
    click_on 'Add Artist To List'
  end

  expect(current_path).to eq(choose_seeds_path)

  expect(page).to have_content("1) Artist - Michael Jackson")
  expect(page).to have_content("2) Artist - Jackson Michael")
  end
end
