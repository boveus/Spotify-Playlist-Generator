class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_current_user_auth_token

  def index
    @type = search_params["type"]
    raw_search_results = SpotifyService.new(token, search_params.to_hash).request_search
    @search_results = SearchResults.new(raw_search_results).parse_response
  end

  private
  def search_params
    params.permit("q", "type")
  end
end
