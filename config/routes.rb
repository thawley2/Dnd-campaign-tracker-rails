Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/campaigns', to: 'campaigns#index'
  get '/campaigns/:id', to: 'campaigns#show'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/campaigns/:campaign_id/players', to: 'campaigns/players#index'
end
