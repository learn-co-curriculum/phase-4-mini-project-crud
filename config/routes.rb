Rails.application.routes.draw do
  resources :spices, only: [:create, :update, :destroy, :index]
end
