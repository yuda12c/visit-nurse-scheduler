Rails.application.routes.draw do
  root "schedules#index"
  resources :schedules
  resources :clients
  resources :users
  devise_for :accounts
end
