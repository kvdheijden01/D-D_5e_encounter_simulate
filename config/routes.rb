Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root "encounters#start"

  resources :creaturetypes

  resources :encounters

  post 'encounters/new', to: 'encounters#new'
  post 'encounters/add', to: 'encounters#add'
  post 'encounters/add_creature', to: 'encounters#add_creature'

end
