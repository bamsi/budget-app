Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home/index'

  resources :categories do
    resources :expenditures
  end
  # Defines the root path route ("/")
  root 'home#index'
end
