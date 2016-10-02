Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                    controllers: {omniauth_callbacks: "omniauth_callbacks"}
                    # controllers: {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/users/:id', to: 'welcome#view'

  get '/users/', to: 'welcome#view'

  get '/designs/new/:id', to: 'design#new', as: :new_design_path

  post '/designs', to: 'design#create'

end
