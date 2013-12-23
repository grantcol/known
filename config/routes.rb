Known::Application.routes.draw do
  root to: 'posts#index'
  resources :posts
  resources :links
  resources :users
  post 'posts/recieve'
  post 'links/recieve'
  post 'links/updateExtension'
end
