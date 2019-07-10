Rails.application.routes.draw do

  get "my-tables", to: "my_events#index"

  resources :events, path: 'tables' do
    resources :memberships, only: [:create, :destroy]
  end

  resources :comments, only: [:create]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  authenticated :user do
    root 'events#index', as: :authenticated_root
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users/registrations#new"

end
