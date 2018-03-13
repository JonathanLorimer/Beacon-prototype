Rails.application.routes.draw do

  # root to: '/'

  resources :users, only: [:index, :show, :new, :create]

  resource :sessions, only: [:new, :create, :destroy]



  resources :continents, only:[:index, :show]
  resources :countries, only: [:index, :show]

  resources :regions, only: [:index, :show] do
    resources :cities, only:[:index, :show]
  end

  resources :cities, only:[:index, :show] do
    resources :neighbourhoods, only: [:index, :show]
  end

  resources :neighbourhoods, only: [:index, :show] do
    resources :locations, only: [:index, :show]
  end
  
  # resources :districts, only: [:index, :show] do
    
  # end

  # resources :continents, only:[:index, :show] do
  #   resources :countries, only: [:index, :show]
  # end 

  # resources :countries, only: [:index, :show] do
  #   resources :regions, only: [:index, :show]
  # end 

  # resources :regions, only: [:index, :show] do
  #   resources :cities, only:[:index, :show]
  # end 

  # resources :cities, only:[:index, :show] do
  #   resources :neighbourhoods, only: [:index, :show]
  # end 

  # resources :neighbourhoods, only: [:index, :show] do
  #   resources :districts, only: [:index, :show]
  # end

  # resources :districts, only: [:index, :show] do
  #   resources :locations, only: [:index, :show]
  # end

  # resources :districts, only: [:index, :show]
  # resources :locations, only: [:index, :show]


end
