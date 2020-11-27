Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      resources :users
      # resources :posts
      resources :posts,          only: [:create, :destroy]

      #memberはrailsのメソッド。ユーザーidが含まれているURLを扱うようになる。
      #/api/v1/users/1/follower
      resources :users do
        member do
          get :following, :followers
        end
      end

      resources :relationships,       only: [:create, :destroy]

    end
  end
end
