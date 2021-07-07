Rails.application.routes.draw do
  get "/", to: "sessions#new"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    collection do
      post "/profil/picture", to: "users#profilModify"
    end
  end
end
