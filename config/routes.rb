Rails.application.routes.draw do
  get 'company/index'

  resources :biz_promos

  resources :promos

  devise_for :users
  resources :contacts

  root to: 'home#index'
  resources :subscribe, only: [:new, :update]
  resources :shippings
  get 'gallery' => 'home#gallery'
  get 'bands' => 'home#bands'
  get 'businesses' => 'home#businesses'
end
