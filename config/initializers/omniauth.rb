Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["spotify_key"],ENV["spotify_secret"], scope: 'playlist-read-private user-read-private user-read-email'
# https://developer.spotify.com/web-api/using-scopes/
end
