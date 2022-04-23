Rails.application.routes.draw do
  get "orders/generate_report" => "orders#generate_report"
  
  resources :categories
  resources :items
  resources :customers
  resources :orders
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get "categories/index" => "categories#index" 
  get "items/index" => "items#index"
  get "customers/index" => "customers#index"
  
  root "orders#index"

  post "orders/update_order_status"
end
