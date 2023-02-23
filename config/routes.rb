Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :groups, only: [:index, :new, :create, :show] do
  resources :contracts, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
