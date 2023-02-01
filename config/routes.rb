Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/nations', to: 'nations#index'
  get '/nations/:id', to: 'nations#show'
  get '/ancestries', to: 'ancestries#index'
  get '/ancestries/:id', to: 'ancestries#show'
end
