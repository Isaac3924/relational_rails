Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/nations', to: 'nations#index'
  get '/nations/new', to: 'nations#new'
  get '/nations/:id', to: 'nations#show'
  get '/ancestries', to: 'ancestries#index'
  get '/ancestries/:id', to: 'ancestries#show'
  get '/nations/:nation_id/ancestries', to: 'nation_ancestries#index'
  post '/nations', to: 'nations#create'
end
