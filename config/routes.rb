Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  resources :parents, only:[:edit, :show, :update, :destroy]
  resources :bbsitters, only:[:edit, :show, :update, :destroy]
  resources :pages, only:[:show, :index]
  authenticated :user do
  root to: 'pages#home', as: :root #-> if user is logged in

  end

  unauthenticated :user do
  root 'pages#home', as: :unauthenticated #-> if user is not logged in
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
