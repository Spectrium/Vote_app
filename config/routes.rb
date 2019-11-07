Rails.application.routes.draw do
  get 'daties/new'
  get 'daties/create'
  get 'daties/edit'
  get 'daties/update'
  get 'daties/destroy'
  devise_for :admins
  root 'home#index'
  
  devise_for :users

  resources :daties
  resources :candidats
  resources :admins
  resources :recensements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
