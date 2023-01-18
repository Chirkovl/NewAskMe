Rails.application.routes.draw do
  root "questions#index"
  resources :questions
  resources :users, only: %i[new create destroy edit update]
  resource :session, only: %i[new create destroy]
end
