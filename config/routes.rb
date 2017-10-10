Rails.application.routes.draw do
  root "home#index"
  get '/auth/spotfy', as: :spotify_login
  get '/auth/spotify/callback', to: 'sessions#create'

  resources :dashboard, only: [:index]
end
