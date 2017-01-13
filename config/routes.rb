Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :followers, only: [:index]
  patch 'users/:id/follow', to: 'users#follow', as: :user_follow
  patch 'users/:id/unfollow', to: 'users#unfollow', as: :user_unfollow

  mount ActionCable.server => '/timeline'
  root 'tweets#index'
end
