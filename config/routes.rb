Rails.application.routes.draw do
  devise_for :users
  root "targets#index"

  resources :targets do
    resources :comments, only: [:edit, :create, :update, :destroy]
    resources :steps, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index] do
    resources :comments, only: [:edit, :create, :update, :destroy]
  end
end
