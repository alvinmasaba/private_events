Rails.application.routes.draw do
  devise_for :users

  root "events#index"
  
  resources :events

  resources :users, only: [:show]

  resources :event_attendees, only: [:new, :create, :destroy]

  resources :invites
end
