Rails.application.routes.draw do
  get "/", to: "sessions#new"
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    collection do
      post "/profil/picture", to: "users#profilModify"
    end
  end
end
