class SearchResults
  def initialize(response)
    @response = response
  end

  def parse_response
    if @response["artists"]
      artists_results
    elsif @response["albums"]
      albums_results
    elsif @response["tracks"]
      tracks_results
    end
  end

  def tracks_results
    @response["tracks"]["items"].map do |track|
      Track.new(track["name"], track["artists"].first["name"],
         track["album"]["name"], track["album"]["images"].third||"blank",
          track["id"])
    end
  end

  def artists_results
    @response["artists"]["items"].map do |artist|
      Artist.new(artist["name"], artist["images"].third||"blank", artist["genres"], artist["id"])
    end
  end
end
