Rails.application.routes.draw do
  resources :escape_games do
    resources :questions
  end
end
