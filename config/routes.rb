Rails.application.routes.draw do
  # resources :escape_games do
  #   resources :questions
  # end

  # Rodolphe
  resources :escape_games do
    post :check_answers, on: :member
    resources :questions
  end
end
