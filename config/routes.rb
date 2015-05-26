Rails.application.routes.draw do
  devise_for :users
  resources :contacts

  root to: 'home#index'
  resources :subscribe
  resources :shippings
  get 'contact' => 'home#contact'
end
