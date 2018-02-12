Rails.application.routes.draw do
  devise_for :users
  root "targets#index"

  resources :targets do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :comments, only: [:create, :destroy]
  end
end
