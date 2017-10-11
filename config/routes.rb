Rails.application.routes.draw do
  root "home#index"
  get '/auth/spotify', as: :spotify_login
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/dashboard/create_playlist', as: :create_playlist, to: 'playlist#new'
  post '/dashboard/create_playlist', to: 'playlist#create'
  resources :dashboard, only: [:index]
end
