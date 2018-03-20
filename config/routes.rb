Rails.application.routes.draw do

  # root to: '/'

  resources :users, only: [:index, :show, :new, :create] do
    resources :diaries, only: [:index, :show]
    resources :updates, only: [:index, :show]
  end

  resource :sessions, only: [:new, :create, :destroy]


  resources :coordinates, only: [:index, :show, :new, :create]

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

  resources :locations, only: [:index, :show]
  end
