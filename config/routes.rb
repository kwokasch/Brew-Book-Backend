Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :beers, only: [:index, :show, :create, :update]
  resources :searches
  resources :users, only: [:create]
end
