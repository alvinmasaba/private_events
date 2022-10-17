Rails.application.routes.draw do
  devise_for :users

  root "events#index"
  
  resources :events do
    resources :invites, only: [:new, :create]
  end

  resources :users, only: [:show]

  resources :event_attendees, only: [:new, :create, :destroy]
end
