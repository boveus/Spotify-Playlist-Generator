Rails.application.routes.draw do
  root "home#index"
  get '/auth/spotfy' as: :spotify_login
end
