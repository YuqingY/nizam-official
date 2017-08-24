Rails.application.routes.draw do

  # get 'insights/main'

  get 'comments/new'

  get 'comments/create'

  ActiveAdmin.routes(self)


  resources :tickets, except: :new do
    collection do
      get "list"
    end

  end


  resources :calls, only: [:new]

  root to: "pages#home"
  # Controller#action
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/insights" , to: 'insights#summary'
  get "/insights/tickets", to: "insights#tickets"
  get "/insights/users" , to: 'insights#users'
  get "/insights/calls" , to: 'insights#calls'
  get "/insights/leaderboard", to: 'insights#leaderboard'
  get "/insights/mystats", to: 'insights#mystats'

  mount Blazer::Engine, at: "blazer"
end
