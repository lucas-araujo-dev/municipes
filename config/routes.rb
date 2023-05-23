Rails.application.routes.draw do
  root to: 'municipes#index'

  resources :municipes, except: %i[show destroy]
end
