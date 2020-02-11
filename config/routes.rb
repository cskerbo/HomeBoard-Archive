Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  devise_scope :user do
    match '/session/user', to: 'devise/sessions#create', via: :post
  end
  resources :user_homes
  resources :widgets
  resources :homes
  resources :homes
  resources :users do
    resources :user_homes
  end
  root 'users#show'
  get '/logout', to: 'remove#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
