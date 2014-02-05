MusicApp::Application.routes.draw do


  resources :songs do
    resources :comments
  end

  

  resources :users

  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
  resources :sessions
  
  root to: "home#index"

  match 'songs/:song_id/comments/:id', to: 'comments#flag', as: :comments_flag

  match '/admin', to: 'admin#index', as: :admin


end
