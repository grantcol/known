Known::Application.routes.draw do
  get "sessions/new"
  #root to: 'posts#index'
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#new"
  resources :users
  resources :sessions
  resources :posts
  resources :links
  resources :users
  resources :tags
  post 'posts/recieve'
  post 'links/recieve'
  post 'links/updateExtension'
end
