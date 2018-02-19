Rails.application.routes.draw do
  devise_for :users
  root "targets#index"

  resources :targets do
    resources :comments, only: [:edit, :create, :update, :destroy]
    resources :steps, only: [:new, :edit, :create, :update, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :comments, only: [:edit, :create, :update, :destroy]
  end
end
