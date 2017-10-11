Rails.application.routes.draw do
  root "home#index"
  get '/auth/spotify', as: :spotify_login
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/dashboard/create_playlist', as: :create_playlist

  resources :dashboard, only: [:index]
end
