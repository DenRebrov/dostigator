Rails.application.routes.draw do
  devise_for :users
  root "targets#index"

  resources :targets do
    resources :comments, only: [:edit, :create, :update, :destroy]
    resources :steps, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :comments, only: [:edit, :create, :update, :destroy]
  end

  resources :answers, only: [:create, :destroy]

  mount ActionCable.server => '/cable'
end
