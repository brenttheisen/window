Rails.application.routes.draw do
  root to: 'home#index'
  resources :subscribe
  get 'contact' => 'home#contact'
end
