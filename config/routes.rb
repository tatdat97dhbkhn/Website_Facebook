Rails.application.routes.draw do
  devise_for :users,
    controllers:{omniauth_callbacks: "omniauth_callbacks"}
  namespace :admin do
    resources :users, only: %i(index destroy edit update new)
    resources :news
  end
  root "pages#index"
  resources :users, except: %i(index destroy)
  resources :news
end
