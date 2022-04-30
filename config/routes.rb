Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main_page#index"
  get "log_out", to: "authenticate_user#destroy"
  get "log_in", to: "authenticate_user#new"
  post "log_in", to: "authenticate_user#create"

  resources :main_page, only: [:index]
  resources :users, only: [:new, :create, :update]

end
