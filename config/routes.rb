Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  end

  root 'users#index'  
  resources :users, only: [:index, :new]  

end

