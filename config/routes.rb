Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/campaigns', to: 'campaigns#index'
  get '/campaigns/new', to: 'campaigns#new'
  get '/campaigns/:id', to: 'campaigns#show'
  post '/campaigns', to: 'campaigns#create'
  get '/campaigns/:id/edit', to: 'campaigns#edit'
  patch '/campaigns/:id', to: 'campaigns#update'
  delete '/campaigns/:id', to: 'campaigns#destroy'

  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/players/:id/edit', to: 'players#edit'
  patch '/players/:id', to: 'players#update'
  delete 'players/:id', to: 'players#destroy'

  get '/campaigns/:campaign_id/players', to: 'campaigns/players#index'
  get '/campaigns/:campaign_id/players/new', to: 'campaigns/players#new'
  post '/campaigns/:campaign_id/players', to: 'campaigns/players#create'
end
