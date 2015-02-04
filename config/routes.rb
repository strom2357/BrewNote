Rails.application.routes.draw do
  resources :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :brews
  resources :brew_seshes, only: [:new, :create, :destroy]
end
