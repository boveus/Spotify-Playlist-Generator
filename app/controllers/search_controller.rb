class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    token = current_user.token
    @type = search_params[:type]
    raw_search_results = SpotifyService.new(token, search_params.to_hash).request_search
    @search_results = SearchResults.new(raw_search_results).parse_response
  end

  private
  def search_params
    params.permit("q", "type")
  end
end
