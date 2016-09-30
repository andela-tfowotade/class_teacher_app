Rails.application.routes.draw do
  resources :forms, only: [:index, :new, :create] do
    resources :students, only: [:index, :new, :create]
  end

  root "forms#index"
end
