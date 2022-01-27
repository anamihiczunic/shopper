Rails.application.routes.draw do
  get 'order_items/create'
  root to: 'categories#index'

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  # patch '/cart/checkout', to: 'orders#create'
  patch '/cart/checkout', to: 'orders#update'
end
