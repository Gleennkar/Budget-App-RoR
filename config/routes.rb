Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :categories
  resources :payments
  resources :splash, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end
