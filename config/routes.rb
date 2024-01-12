Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tasks, only: [ :show, :create ]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
