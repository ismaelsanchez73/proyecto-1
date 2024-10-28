Rails.application.routes.draw do
  # Define the root path route ("/")
  root 'posts#index'

  # RESTful routes for posts
  resources :posts

  # Devise routes for user authentication
  devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Dynamic PWA files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end