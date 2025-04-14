Rails.application.routes.draw do
  root "schedules#index"
  resources :schedules
  resources :clients
  resources :users, only: [:new, :create]
  devise_for :users
end
