Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :movies, only: [:index, :show]
      resources :user_movies, path: 'favorites', only: [:index]
    end
  end
end
