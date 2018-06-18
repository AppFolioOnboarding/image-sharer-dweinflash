Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#home'
  resources :images, only: %i[destroy index new create show]
  resources :feedbacks, only: [:new]
  root 'images#index'
end
