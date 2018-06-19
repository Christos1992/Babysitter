Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :parents, only:[:edit, :show, :update, :destroy]
  resources :bbsitters, only:[:edit, :show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
