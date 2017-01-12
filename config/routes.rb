Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  patch 'users/:id/follow', to: 'users#follow', as: :user_follow

  mount ActionCable.server => '/timeline'
  root 'tweets#index'
end
