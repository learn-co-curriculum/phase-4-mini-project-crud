Rails.application.routes.draw do
  resources :spices, only: %i[index create destroy]
  patch '/spices/:id', to: 'spices#update'
end
