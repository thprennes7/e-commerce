Rails.application.routes.draw do
  resources :items do
    resources :cat_pictures, only: [:create]
  end
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
