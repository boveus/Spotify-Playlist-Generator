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
end
