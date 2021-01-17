Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :show]
      resources :user_movies, path: 'favorites', only: [:index]
    end
  end
end
