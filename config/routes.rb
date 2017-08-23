Rails.application.routes.draw do

  # get 'insights/main'

  get 'comments/new'

  get 'comments/create'

  ActiveAdmin.routes(self)
  resources :tickets do
    get :autocomplete_cnic, on: :collection
  end
  resources :calls, only: [:new]

  root to: "tickets#index"
  # Controller#action
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/insights" , to: 'insights#summary'
end
