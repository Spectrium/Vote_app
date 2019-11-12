Rails.application.routes.draw do
  get 'votes/verification', as: "verification"
  post 'votes/verifiee', as: "verifiee"
  get 'votes/validation', as: "validation"
  post 'votes/valider', as: "valider"
  get 'votes/reset', as: "reset"
  get 'admins/sign', as: "sign_admin"
  get 'communes/result', as: "result_cmn"
  get 'regions/result', as: "result_rg"
  get 'users/sign', as: "sign_user"
  get 'recensements/affiche'
  root 'home#index'
  
  devise_for :admins
  
  devise_for :users

  resources :daties
  resources :regions do 
    resources :communes 
  end 
  resources :communes  do
    resources :fokontanies
  end
  resources :fokontanies do
    resources :recensements
  end
  resources :admins
  resources :votes, only: [:new]
  resources :candidats do
    resources :votes, except: [:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
