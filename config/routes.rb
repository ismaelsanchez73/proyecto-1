Rails.application.routes.draw do
  # Define the root path route ("/")
  root 'posts#index'

  # Static routes for pages
  get 'about', to: 'about#index'
  get 'contacto', to: 'contacto#index'
  get 'services', to: 'services#index'

  # RESTful routes for posts
  resources :posts

  # Devise routes for user authentication
  devise_for :users

  # Health check route
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # Dynamic PWA files
  get 'service-worker', to: 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest', to: 'rails/pwa#manifest', as: :pwa_manifest
end
