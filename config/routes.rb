Rails.application.routes.draw do

  get '/registration', to: "signup_pages#current"

  get  'events/display'
  get  'events/register'
  get  'verification', to: "events#verification"   
  get  'users/cancel_ticket'
  get  'users/users_registered'

  get  'tickets/index' => 'tickets#index'
  post 'tickets/create' => "tickets#create"

  root  'users#new'

  resources :users
  resources :events
  resources :tickets
  
end
