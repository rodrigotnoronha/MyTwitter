Rails.application.routes.draw do
  mount ActionCable.server => '/timeline'
  devise_for :users
  resources :users, only: [:index, :show]
  patch 'users/:id/follow', to: 'users#follow', as: :user_follow
  patch 'users/:id/unfollow', to: 'users#unfollow', as: :user_unfollow

  resources :followers, only: [:index]
  resources :followings, only: [:index]

  patch 'tweet/:id/retweet', to: 'tweets#retweet', as: :tweet_retweet

  root 'tweets#index'
end
