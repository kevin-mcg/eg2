Rails.application.routes.draw do
  root "escape_games#index"

  resources :escape_games do
    post :check_answers, on: :member
    resources :questions
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users
  
  get "signup" => "users#new"
  get "signin" => "sessions#new"
end
