Rails.application.routes.draw do
  
  get 'tickets/create'

  get 'events/display'
  get 'events/register'
  get 'users/cancel_ticket'
  get 'users/users_registered'

  post 'tickets/create'
  
  root  'events#display'

  resources :users
  resources :events
  resources :tickets
  
end
