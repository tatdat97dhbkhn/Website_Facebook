Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users,
    controllers:{omniauth_callbacks: "omniauth_callbacks"}
  namespace :admin do
    resources :users, only: %i(index destroy edit update new)
    resources :news
  end
  root "pages#index"
  post "/add_new_status", to: "news#create",
    as: "add_new_status"
  mount ActionCable.server => '/cable'
  resources :users, except: %i(index destroy)
  resources :news
end
