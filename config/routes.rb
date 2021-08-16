Rails.application.routes.draw do
  root "books#index"
  get "/", to: "books#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index]
  resources :users, only: [:edit, :update, :show]
end
