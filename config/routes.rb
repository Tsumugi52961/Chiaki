Rails.application.routes.draw do
  namespace :api do
    resources :bangumis, only: %i[index show create]
    resources :subscriptions, only: %i[index show create]
  end
end
