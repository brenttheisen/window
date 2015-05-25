Rails.application.routes.draw do
  root to: 'home#index'
  resources :subscribe
  resources :shippings
  get 'contact' => 'home#contact'
end
