Rails.application.routes.draw do
 

  # get 'static_pages/home'
  root   'static_pages#home'










  # get 'api/private' => 'private#private'
  # get 'api/private-scoped' => 'private#private_scoped'
 #Auth0のrouter.
  get 'auth/private' => 'private#private'
  get 'auth/private-scoped' => 'private#private_scoped'


       
  resources :posts

      resources :users
      # これは正しいから、あとあとコメントアウト
      # resources :posts,          only: [:create, :destroy]
      resources :users do
        member do
          get :following, :followers
        end
      end
      resources :relationships,       only: [:create, :destroy]
    end



# これは実験
#  定義されていないメソッドの呼び出しが行われたときに発生します。エラー。
# 　     resources :posts, only: [:create, :destroy]