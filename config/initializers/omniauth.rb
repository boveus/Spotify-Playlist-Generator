Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["spotify_key"],ENV["spotify_secret"],
   scope: 'user-read-private user-read-email playlist-modify-private user-top-read' 
# https://developer.spotify.com/web-api/using-scopes/
end
