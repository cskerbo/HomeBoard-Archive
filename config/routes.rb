Rails.application.routes.draw do
  resources :user_homes
  resources :widgets
  resources :homes
  resources :users do
    resources :user_homes
  end
  root 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
