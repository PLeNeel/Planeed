Rails.application.routes.draw do
  devise_for :users
  # get 'show/:id', to: 'users#show'
  root to: 'users#show'
  get 'show/:id', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toxics, only: [:update, :show] do
    resources :withdraws, only: [:create]
  end

  resources :availabilities, only: [:index, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
    resources :missions, only: [:index]
  end
  resources :missions, only: [:new, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :edit, :update, :destroy]
  resources :services, only: [:show, :edit, :update] do
    resources :messages, only: [:create, :destroy]
    resources :toxics, only: [:index]
    resources :chatrooms, only: [:show, :create, :destroy] do
      resources :messages, only: :create
    end
  end
  resources :chatrooms, only: [:show, :create, :destroy] do
    resources :messages, only: :create
  end
  resources :missions, only: [:index]
  resources :scans, only: [:new, :create]
end
