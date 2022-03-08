Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "api/v1/auth", controllers: {
    sessions: "api/v1/devise_token_auth/sessions",
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :craft_beers, only: %w[index get create]
      resources :craft_beer_types, only: %w[index]
      resources :hops, only: %w[index]
      resources :flavors, only: %w[index]
    end
  end
end
