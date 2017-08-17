Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :tickets

  root to: "tickets#index"
  # Controller#action
  devise_for :users

  get 'new_call', to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
