Rails.application.routes.draw do
  resources :contacts

  root to: 'home#index'
  resources :subscribe
  resources :shippings
  get 'contact' => 'home#contact'
end
