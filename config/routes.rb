Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :contracts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
