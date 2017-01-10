Rails.application.routes.draw do
  mount ActionCable.server => '/timeline'
  root 'tweets#index'
end
