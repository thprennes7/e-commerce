#Creating routes with resource
Rails.application.routes.draw do
  resources :banners do
    resources :banner_images
  end
  resources :order_details
  resources :carts
  resources :items do
    resources :cat_pictures, only: [:create]
  end
  devise_for :users
  resources :users
  resources :orders, only: [:create, :show]
  #Main route, it displays the home page with the items.
  root to: 'items#index'
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
