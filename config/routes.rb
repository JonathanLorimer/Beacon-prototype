Rails.application.routes.draw do

  # root to: '/'

  resources :users, only: [:index, :show, :new, :create]

  # resource :session, only: [:new, :create, :destroy]



  resources :continents, only:[:index, :show]
  resources :countries, only: [:index, :show]
  resources :regions, only: [:index, :show]
  resources :cities, only:[:index, :show]
  resources :neighbourhoods, only: [:index, :show]
  resources :districts, only: [:index, :show]
  resources :locations, only: [:index, :show]



end
