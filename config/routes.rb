Rails.application.routes.draw do
  devise_for :admins
  root 'home#index'
  
  devise_for :users

  resources :admins
  resources :recensements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
