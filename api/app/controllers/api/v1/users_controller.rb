module Api
    module V1
     class UsersController < ApplicationController
       #全てのユーザーを表示する。
       def index
         @users = User.all
         render json: @users
       end
   
       #特定のユーザーを表示する。   
   #  　　def show
   #     　@user = User.find(params[:id])
   #     　@posts = @user.posts.paginate(page: params[:page])
   #  　　end
   
        #ユーザーを新規作成する
   #  　　 def new
   # 　　　　@user = User.new
   #      end
   
   
        #ユーザーを作成する
        def create
           @user = User.new(user_params)
           if @user.save
             @user.send_activation_email
             flash[:info] = "Please check your email to activate your account."
             redirect_to root_url
           else
             render 'new'
           end
         end
   
   
   
         private
   
       def user_params
         params.require(:user).permit(:name, :email, :password,
                                      :password_confirmation)
       end
    
   
   end
   
   end
   end