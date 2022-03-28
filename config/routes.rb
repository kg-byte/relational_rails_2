Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dentists', to: 'dentists#index'
  get '/dentists/new', to: 'dentists#new'
  get '/dentists/:id', to: 'dentists#show'
  post '/dentists', to: 'dentists#create'
  get '/dentists/:id/edit', to: 'dentists#edit'
  patch '/dentists/:id', to: 'dentists#update'
  
  get '/patients', to:'patients#index'
  get '/patients/:id', to: 'patients#show'
  get '/dentists/:dentist_id/patients', to: 'dentist_patients#index'
  get '/dentists/:dentist_id/patients/new', to: 'patients#new'
  post '/dentists/:dentist_id/patients', to:'patients#create'
  get '/patients/:id/edit', to: 'patients#edit'
  patch '/patients/:id', to: 'patients#update'
end
