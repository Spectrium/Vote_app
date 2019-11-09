Rails.application.routes.draw do

  get 'fokontanies/index'
  root 'home#index'
  devise_for :admins
  
  devise_for :users

  resources :daties
  resources :regions
  resources :communes
  resources :admins
  resources :recensements
  resources :candidats do
    resources :votes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
