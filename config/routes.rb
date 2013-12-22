Known::Application.routes.draw do
  root to: 'posts#index'
  resources :posts
  resources :links
  post 'posts/recieve'
  post 'links/recieve'
end
