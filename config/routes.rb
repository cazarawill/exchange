Rails.application.routes.draw do
  #get 'home/index'

  #get 'home/exchange'

  root 'home#index'
  post 'exchange', to: 'home#exchange'
end