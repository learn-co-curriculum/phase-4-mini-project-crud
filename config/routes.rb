Rails.application.routes.draw do
  resources :spices, only: %i[index create update destroy]
end
