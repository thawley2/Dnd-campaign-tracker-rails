Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/campaigns', to: 'campaigns#index'
  get '/campaigns/new', to: 'campaigns#new'
  post '/campaigns', to: 'campaigns#create'
  get '/campaigns/:id/edit', to: 'campaigns#edit'
  patch '/campaigns/:id', to: 'campaigns#update'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/campaigns/:id', to: 'campaigns#show'
  get '/campaigns/:campaign_id/players', to: 'campaigns/players#index'
  get '/campaigns/:campaign_id/players/new', to: 'campaigns/players#new'
  post '/campaigns/:campaign_id/players', to: 'campaigns/players#create'
end
