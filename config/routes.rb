Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :availabilities, only: [:index] do
    resources :bookings, only: [:new, :create]
    resources :missions, only: [:index]
  end
  resources :bookings, only: [:index] do
    resources :services, only: [:show]
  end
  resources :services do
    resources :messages, only: [:create, :destroy]
    resources :toxics, only: [:index]
  end
  resources :toxics do
    resources :withdraws, only: [:create, :new]
  end
end
