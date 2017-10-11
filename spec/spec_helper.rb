require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|

  config.before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:spotify] = {
   "info" => {
     "name" => 'Bobby Huggins',
     "email" => 'Bobby@thegmails.com',
     "image" => 'capybarawontseeitanyway.jpg'
   },
   "credentials" => {
     "token" => "3jdewidjiew0",
     "refresh_token" => "hamburgler",
     "expires_at" => 14232525,
         }
       }
    stub_request(:get, /api.spotify.com/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})
  end
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  def fixture_path
	  File.expand_path('../fixtures', __FILE__)
	end

	def fixture(file)
	  File.new(fixture_path + '/' + file)
	end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

end
