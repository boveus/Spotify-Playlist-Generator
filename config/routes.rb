Rails.application.routes.draw do
  root "home#index"
  get '/auth/spotify', as: :spotify_login
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/dashboard/create_playlist/choose_seeds', as: :choose_seeds, to: 'search#index'
  post '/dashboard/create_playlist/choose_seeds', as: :new_search, to: 'search#index'
  get '/dashboard/create_playlist', as: :create_playlist, to: 'search#new'
  resources :dashboard, only: [:index]
end
