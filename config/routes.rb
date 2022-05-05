Rails.application.routes.draw do
  resources :spices, except: [:show]
end
