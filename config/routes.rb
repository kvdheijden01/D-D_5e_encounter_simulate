Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "encounters#start"

  resources :creaturetypes
  resources :attacks
  resources :encounters
  resources :players

  post 'encounters/new', to: 'encounters#new'
  post 'encounters/add_enemy', to: 'encounters#add_enemy'
  post 'encounters/add_party', to: 'encounters#add_party'
  post 'encounters/add_creature', to: 'encounters#add_creature'
  post 'encounters/add_player', to: 'encounters#add_player'
  post 'creaturetypes/add_attack', to: 'creaturetypes#add_attack'

end
