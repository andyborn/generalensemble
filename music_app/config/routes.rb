MusicApp::Application.routes.draw do
  resources :songs


  resources :users

  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
  resources :sessions
  
  root to: "users#index"
end
