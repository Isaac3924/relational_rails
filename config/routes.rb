Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/nations', to: 'nations#index'
  get '/nations/new', to: 'nations#new'
  get '/nations/:id', to: 'nations#show'
  get '/ancestries', to: 'ancestries#index'
  get '/ancestries/:id', to: 'ancestries#show'
  get '/nations/:nation_id/ancestries', to: 'nation_ancestries#index'
  post '/nations', to: 'nations#create'
  get '/ancestries/:id/edit', to: 'ancestries#edit'
  get '/nations/:id/edit', to: 'nations#edit'
  patch '/nations/:id', to: 'nations#update'
  get '/nations/:nation_id/ancestries/new', to: 'nation_ancestries#new'
  post '/nations/:nation_id/ancestries', to: 'nation_ancestries#create'
  patch '/ancestries/:id', to: 'ancestries#update'
  get '/nations/:nation_id/ancestries/alphabetical_index', to: 'nation_ancestries#alphabetical_index'
  delete 'nations/:id', to: 'nations#destroy'
end
