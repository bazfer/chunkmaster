Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  devise_for :users

  root to: "pages#home"

  get '/users/sign_out', to: 'pages#home'
  # get '/chat', to: 'rooms#index'
  get '/chat', controller: :rooms, action: :index


  resources :chunks
end
