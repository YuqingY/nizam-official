Rails.application.routes.draw do
  resources :tickets

  root to: "tickets#index"
  # Controller#action
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
