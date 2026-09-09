Rails.application.routes.draw do
  root "escape_games#index"

  resources :escape_games do
    post :check_answers, on: :member
    resources :questions
  end
end
