Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }


  resources :tickets, only: [:index, :new, :create, :show, :destroy]
  resource :search, only: [:show, :create]

  root to: 'searches#show'

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
    resources :routes
    resources :tickets
    resources :resources, only: [:index]
  end

  # resources :carriages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
