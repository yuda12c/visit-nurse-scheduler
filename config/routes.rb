Rails.application.routes.draw do
  root "schedules#index"
  resources :schedules
  resources :clients
  devise_for :users
end
