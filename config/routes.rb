Known::Application.routes.draw do
  #root to: 'links#index'
  root :to => "users#new"
  get "sessions/new"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  post 'posts/recieve'
  post 'links/recieve'
  post 'links/updateExtension'

  resources :users
  resources :sessions
  resources :posts
  resources :links
  resources :tags
  resources :groups
  #resources :messages

end
