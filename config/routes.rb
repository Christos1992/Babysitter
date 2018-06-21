Rails.application.routes.draw do

devise_for :users, controllers: { registrations: "registrations" }
  resources :parents, only:[:edit, :show, :update, :destroy] do
    resources :reservations, only:[:show, :index]
  end

  resources :bbsitters, only:[:edit, :show, :update, :destroy] do
    resources :reservations, only:[:new, :create, :show, :index]
  end
  resources :pages, only:[:show, :index]

  resources :reservations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  authenticated :user do
    root to: 'pages#home', as: :root #-> if user is logged in
  end

  unauthenticated :user do
    root 'pages#home', as: :unauthenticated #-> if user is not logged in
  end
end


