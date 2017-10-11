require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:spotify] = {
     "info" => {
       "name" => 'Bob Huggins',
       "email" => 'Bobby@thegmails.com',
       "image" => 'capybarawontseeitanyway.jpg'
     },
     "credentials" => {
       "token" => "3jdewidjiew0",
       "refresh_token" => "hamburgler",
       "expires_at" => 14232525,
         }
       }

    stub_request(:get, /api.spotify.com/)
    .with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'})
    .to_return(status: 200, body: "stubbed response", headers: {})

    stub_request(:get, 'https://api.spotify.com/v1/me/top/artists')
    .to_return(body: fixture('top_artists.json'), headers: {content_type: 'application/json; charset=utf-8'})

    stub_request(:get, 'https://api.spotify.com/v1/me/top/tracks')
    .to_return(body: fixture('top_tracks.json'), headers: {content_type: 'application/json; charset=utf-8'})

    stub_request(:get, "https://api.spotify.com/recommendations?acousticness=36&danceability=73&duration=20&energy=99&instrumentalness=20&key=76&limit=15&liveness=1&loudness=99&mode=34&popularity=8")
    .to_return(body: fixture('recommended_tracks.json'), headers: {content_type: 'application/json; charset=utf-8'})
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  def fixture_path
	  File.expand_path('../fixtures', __FILE__)
	end

	def fixture(file)
	  File.new(fixture_path + '/' + file)
	end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
