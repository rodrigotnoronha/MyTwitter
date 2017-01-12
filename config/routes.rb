Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  get 'search', to: 'users#search', as: :users_search

  mount ActionCable.server => '/timeline'
  root 'tweets#index'
end
