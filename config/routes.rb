Rails.application.routes.draw do
  
  get 'events/new'

  resources :events
end
