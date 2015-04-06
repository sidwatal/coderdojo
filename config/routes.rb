Rails.application.routes.draw do
  
  get 'tickets/create'

  get 'events/display'
  get 'events/register'
  get 'users/cancel_ticket'
  get 'signup' => 'users#new'

  post 'tickets/create'
  
  root  'users#new'

  resources :users
  resources :events
  resources :tickets
  
end
