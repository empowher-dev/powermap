Rails.application.routes.draw do
  resources :locations, only: [:index, :create, :edit]
  # devise_for :users
  # root to: "home#index"
end
