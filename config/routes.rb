Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#home'
  resources :images, only: %i[index new create show]
  root 'images#index'
end
