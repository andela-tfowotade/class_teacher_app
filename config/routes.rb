Rails.application.routes.draw do
  resources :forms, only: [:index, :new, :create]

  root "forms#index"
end
