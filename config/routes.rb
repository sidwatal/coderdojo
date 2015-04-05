Rails.application.routes.draw do

  get  'events/display'
  get  'events/register'
  get  'users/cancel_ticket'
  get  'users/users_registered'

  #get  'tickets/index' => 'tickets#index'
  #post 'tickets/create' => "tickets#create"
  
  root  'events#display'

  resources :users
  resources :events
  resources :tickets
  
end
