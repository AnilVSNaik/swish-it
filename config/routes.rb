Rails.application.routes.draw do
  get '/home' => "home#index", as: "home"
	resource :session, controller: "sessions", only: [:create]
  resources :tasks
  resources :lists
  resources :users

  root 'sessions#new'

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
