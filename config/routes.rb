Rails.application.routes.draw do
  root to: "pages#home"

  resources :chunks
  resources :room_messages
  resources :rooms

  devise_for :users


  get '/users/sign_out', to: 'pages#home'
  # get '/chat', to: 'rooms#index'
  get '/chat', controller: :rooms, action: :index


end
