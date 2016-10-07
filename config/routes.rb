Rails.application.routes.draw do
  namespace :admin do
    resources :users
resources :carts
resources :designs
resources :items

    root to: "users#index"
  end

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                    controllers: {omniauth_callbacks: "omniauth_callbacks"}
                    # controllers: {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :charges
  
  root 'welcome#index'

  get '/users/:id', to: 'welcome#view'

  get '/users/', to: 'welcome#view', as: :user_profile

  get '/designs/new/:id', to: 'design#new', as: :new_design

  post '/designs', to: 'design#create'

  get '/designs/delete/:id', to: 'design#delete', as: :delete_design

  get '/cart/new/:id', to: 'cart#new', as: :new_cart

  get '/cart/show', to: 'cart#show', as: :show_cart

  get '/designs/competition', to: 'design#competition', as: :competition
end
