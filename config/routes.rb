Rails.application.routes.draw do

  get 'fokontanies/index'
  get 'votes/verification', as: "verification"
  post 'votes/verifiee', as: "verifiee"
  root 'home#index'
  devise_for :admins
  
  devise_for :users

  resources :daties
  resources :regions
  resources :communes
  resources :admins
  resources :recensements
  resources :votes, only: [:new]
  resources :candidats do
    resources :votes, except: [:new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
