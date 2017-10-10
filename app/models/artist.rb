class Artist
  attr_reader :name,
              :image_path,
              :genres,
              :artist_id

  def initialize(name, image_path, genres, artist_id)
    @name = name
    @image_path = image_path
    @genres = genres
    @artist_id = artist_id
  end

  def self.top_artists(top_artists)
    top_artists["items"].map do |artist|
      Artist.new(artist["name"], artist["images"].third["url"], artist["genres"], artist["id"])
    end
  end
end
