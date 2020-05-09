Rails.application.routes.draw do
  # get '/shelters', to: 'shelters#index'
  # get 'shelters/:id', to: 'shelters#show'
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
  resources :shelters, only: [:index, :show, :new, :create]
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:shelter_id/pets', to: 'pets#index', param: 'shelter_id'
end
