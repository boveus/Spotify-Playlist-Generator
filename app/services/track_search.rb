class TrackSearch
  def initialize(params)
    @params = params
  end
  def top_tracks
    @params["items"].map do |track|
      Track.new(track["name"], track["artists"].first["name"],
         track["album"]["name"], track["album"]["images"].third["url"],
          track["id"])
    end
  end
end
