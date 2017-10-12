Rails.application.routes.draw do
  root "home#index"
  get '/auth/spotify', as: :spotify_login
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/dashboard/create_playlist/choose_seeds', as: :choose_seeds, to: 'search#index'
  post '/dashboard/create_playlist/choose_seeds', to: 'search#index'
  get '/dashboard/create_playlist', as: :new_search, to: 'search#new'
  get '/dashboard/create_playlist/choose_attributes', as: :create_playlist, to: 'playlist#new'
  get '/dashboard/top_artists', as: :top_artists, to: 'dashboard#top_artists'
  get '/dashboard/top_tracks', as: :top_tracks, to: 'dashboard#top_tracks'
  get '/user/logout', as: :user_logout, to: 'dashboard#logout'
  resources :dashboard, only: [:index]
end
