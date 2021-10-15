Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root "creature#index"

  get "/creature", to: "creature#index"
end
