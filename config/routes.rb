Rails.application.routes.draw do
  devise_for :users
  root "targets#index"

  resources :targets
  resources :users, only: [:show, :edit, :update]
end
