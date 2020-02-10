Rails.application.routes.draw do
  devise_for :users
  resources :user_homes
  resources :widgets
  resources :homes
  resources :users do
    resources :user_homes
  end
  resources :session
  root 'users#show'
  get '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
