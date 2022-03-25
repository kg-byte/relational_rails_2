Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dentists', to: 'dentists#index'
  get 'dentists/:id', to: 'dentists#show'
  get 'patients', to:'patients#index'
  get 'patients/:id', to: 'patients#show'

end
