Rails.application.routes.draw do
  resources :locations, only: [:index, :create, :edit, :update]
  root to: "locations#index"
  # devise_for :users
  # root to: "home#index"
end
