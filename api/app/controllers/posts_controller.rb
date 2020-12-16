class PostsController < ApplicationController
    #↓まだ定義されていないから。
    # before_action :logged_in_user, only: [:create, :destroy]
    # 　before_action :correct_user, only: :destroy
    # def index
    #     @posts = Post.paginate(page: params[:page])
    #   end
      def index
        @posts = Post.all
      end
    #特定の投稿
      def show
        @post = Post.all
      end
    
    #   新規投稿を作成する
      def new
        @post = Post.new
      end

    def create
        @post = current_user.posts.build(posts_params)
        @post.image.attach(params[:post][:image])
        if @post.save
            flash[:success] = "Post created!"
            redirect_to root_url
        else
            render '/'
        end
    end

    def destroy
        @post.destroy
        flash[:success]= "Post deleted!"
        #一つ前のURLを返す。
        redirect_to request.referrer || root_url
    end


    private

    def posts_params
        params.require(:posts).permit(:content, :image)
    end

    def correct_user
        @post = current_user.posts.find_by(id:params[:id])
        redirect_to root_url if @post.nill?
    end
end
