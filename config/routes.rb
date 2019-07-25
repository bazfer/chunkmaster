Rails.application.routes.draw do
  root controller: :pages, action: :home
  devise_for :users

  resources :chunks
  resources :room_messages
  resources :rooms

  get '/users/sign_out', controller: :pages, action: :home
  get '/chat', controller: :rooms, action: :index
end
