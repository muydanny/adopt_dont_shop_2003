Rails.application.routes.draw do
  # get '/shelters', to: 'shelters#index'
  # get 'shelters/:id', to: 'shelters#show'
  resources :shelters, only: [:index, :show, :new, :create]
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  
end
