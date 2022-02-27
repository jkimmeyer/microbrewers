Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :craft_beers
      resources :craft_beer_types
    end
  end

  root "application#index"
  get "/*path", to: "application#index", inline: false, constraints: ->(req) { !(req.fullpath =~ %r{^/rails/active_storage/.*}) }
end
