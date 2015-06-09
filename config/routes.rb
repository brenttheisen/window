Rails.application.routes.draw do
  resources :biz_promos

  resources :promos

  devise_for :users
  resources :contacts

  root to: 'home#index'
  resources :subscribe, only: [:new, :update]
  resources :shippings
  get 'contact' => 'home#contact'
end
