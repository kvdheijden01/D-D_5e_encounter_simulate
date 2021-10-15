Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root "creature#index"

  get "/creature", to: "creature#index"
  get "/creature/:name" to: "creature#show"
  post "/creature", to: "creature#save_creature"
end
