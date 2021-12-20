Rails.application.routes.draw do
  devise_for :models
  devise_for :users

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms
end
