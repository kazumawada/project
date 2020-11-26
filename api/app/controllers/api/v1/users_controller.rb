module Api
    module V1
     class UsersController < ApplicationController
       #全てのユーザーを表示する。
       def index
         @users = User.all
         render json: @users
       end

       #特定のユーザーを表示する
       def show
        @user = User.find(params[:id]) 
        @posts = @user.posts.paginate(page: params[:page])
       end

       # ユーザーを新規作成するページ
       def new
        @user = User.new
       end
   
        #ユーザーを作成するアクション
        def create
           @user = User.new(user_params)
           if @user.save
             log_in @user
             @user.send_activation_email
             flash[:info] = "Please check your email to activate your account."
             redirect_to root_url
           else
             render 'new'
           end
         end

         #id=1のユーザーを編集するページ
         def edit
          #特定の一人を探す。
          @user = User.find(params[:id])
         end

         #ユーザーを更新するアクション
         def update
          @user = User.find(params[:id])
          if @user.update(user_params)
            flash[:success] = "updated!"
            redirect_to @user
          else
            render 'edit'
         end
        end


         #ユーザーを削除するアクション
         def destroy
          User.find(params[:id]).destroy
          flash[:success] = "deleted!"
          redirect_to users_url
         end
   
   
   
         private
   
       def user_params
         params.require(:user).permit(:name, :email, :password,
                                      :password_confirmation)
       end


      #  これから下は、まずsessionを作る必要がある。

      #  def correct_user
      #   @user = User.find(params[:id])
      #   reditect_to(root_url) 
      #  end
    
   
   end
   
   end
   end