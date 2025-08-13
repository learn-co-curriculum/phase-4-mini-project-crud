Rails.application.routes.draw do
  resources :spices, only: [:index]
end
