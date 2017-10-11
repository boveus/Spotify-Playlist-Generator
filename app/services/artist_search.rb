class ArtistSearch
  def initialize(params)
    @params = params
  end

  def top_artists
    @params["items"].map do |artist|
      Artist.new(artist["name"], artist["images"].third["url"], artist["genres"], artist["id"])
    end
  end
end
