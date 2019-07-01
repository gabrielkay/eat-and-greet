Rails.application.routes.draw do

  resources :events do
    resources :memberships, only: [:create, :destroy] #destroy
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

end
