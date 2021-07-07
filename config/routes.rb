Rails.application.routes.draw do
  resources :users do
    collection do
      post "/profil/picture", to: "users#profilModify"
    end
  end
end
