Rails.application.routes.draw do

  get 'comments/new'

  get 'comments/create'

  ActiveAdmin.routes(self)
  resources :tickets
  resources :calls, only: [:new]

  root to: "tickets#index"
  # Controller#action
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
