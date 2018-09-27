Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users,
    controllers:{omniauth_callbacks: "omniauth_callbacks"}
  namespace :admin do
    resources :users, only: %i(index destroy edit update new)
    resources :articles
    get "/update_status", to: "articles#update_status",
      as: "update_status"
    get "/accept_article/:id", to: "articles#accept_article",
      as: "accept_article"
    get "/update_showed", to: "articles#update_showed",
      as: "update_showed"
  end
  root "articles#index"
  post "/add_new_status", to: "articles#create",
    as: "add_new_status"
  post "/add_new_comment", to: "pages#add_new_comment",
    as: "add_new_comment"
  get "/like_status", to: "pages#like_status",
    as: "like_status"
  get "/revoke_status", to: "pages#revoke_status",
    as: "/revoke_status"
  get "/lazyload", to: "pages#lazyload",
    as: "lazyload"
  get "/load_more_data", to: "articles#load_more_data",
    as: "load_more_data"
  get "/search_user", to: "users#search_user",
    as: "search_user"
  get "/track_follow", to: "follows#track_follow",
    as: "track_follow"
  get "/user_update_showed", to: "articles#user_update_showed",
    as: "user_update_showed"
  get "/user_update_watched", to: "articles#user_update_watched",
    as: "user_update_watched"
  get "/list_article_care", to: "pages#list_article_care",
    as: "list_article_care"
  mount ActionCable.server => '/cable'
  resources :users, except: %i(index destroy)
  resources :articles
  resources :follows
end
