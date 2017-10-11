class Track
  attr_reader :name,
              :artist,
              :album,
              :image_path,
              :track_id

  def initialize(name, artist, album, image_path, track_id)
    @name = name
    @artist = artist
    @album = album
    @image_path = image_path
    @track_id = track_id
  end


  def self.top_tracks(top_tracks)
    top_tracks["items"].map do |track|
      Track.new(track["name"], track["artists"].first["name"],
         track["album"]["name"], track["album"]["images"].third["url"],
          track["id"])
    end
  end
end
