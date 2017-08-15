Rails.application.routes.draw do
  get 'pages/index'

  get 'tickets/edit'

  get 'tickets/new'

  get 'tickets/create'

  get 'tickets/update'

  get 'tickets/destroy'

  get 'tickets/index'

  get 'tickets/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
