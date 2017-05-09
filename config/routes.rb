Rails.application.routes.draw do
  root 'home#index'
  post 'exchange', to: 'home#exchange'
end