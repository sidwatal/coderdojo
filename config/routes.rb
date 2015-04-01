Rails.application.routes.draw do
  
  get 'tickets/create'

  get 'events/display'
  get 'events/register'

  post 'tickets/create'
  
  root  'events#display'

  resources :users
  resources :events
  resources :tickets
  
end
