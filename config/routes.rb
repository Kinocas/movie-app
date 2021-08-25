Rails.application.routes.draw do
  devise_for :users

  root to: "movies#index"
  resources :move, only: [:index, :new, :ceate]
end
