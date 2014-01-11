Known::Application.routes.draw do
  #root to: 'links#index'
  root :to => "users#new"
  get "sessions/new"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "static_pages/about"
  get "static_pages/inquire"
  get "static_pages/request_feature"
  get "static_pages/report_bug"
  post 'posts/recieve'
  post 'links/recieve'
  post 'links/updateExtension'

  #resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions
  resources :posts
  resources :links do
    member do
      POST :vote
    end
  end
  resources :tags
  resources :groups
  resources :relationships
  #resources :votes
  #resources :messages
end
