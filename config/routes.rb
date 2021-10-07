Rails.application.routes.draw do
  resources :products
  root to: 'visitors#index'
  devise_for :users, controllers: {sessions: "sessions"}
  
  match '/getotp',to: 'visitors#getotp',via:[:get]
end
