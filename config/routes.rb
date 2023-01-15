Rails.application.routes.draw do
  root "questions#index"
  resources :questions, only: %i[index new create show]
end
