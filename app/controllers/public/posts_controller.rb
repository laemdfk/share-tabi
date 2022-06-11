class Public::PostsController < ApplicationController

  before_action :current_end_user, {only: [:edit, :update, :destroy]}

  def new
    @post_new = Post.new
    # ここにparamsをつけてしまうと、createの値と重複してデータが渡る様子?
  end


  def create
    # @enduser = current_end_user
	  @post_new = Post.new(post_params)
    @post_new.end_user_id = current_end_user.id
    #↑ ユーザーと投稿を紐づけるためのコード

	 if @post_new.save
		 redirect_to public_post_path(@post_new.id), notice:  "投稿の保存に成功しました"
   else
     render "new"
   end
  end

  def index
    @enduser = current_end_user
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @enduser = @post.end_user
  end

  def edit
    @post = Post.find(params[:id])

    if @post.end_user == current_end_user
         render "edit"
    else
        redirect_to posts_path
    end
  end


 def update
   @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post.id),notice: "投稿の編集が完了しました"
    else
        render "edit"
    end
end


    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      
      redirect_to public_enduser_path(current_end_user),notice: "投稿の削除に成功しました"
    end


	private

   # params.require(:モデル名).permit(カラム名)の形で記入しないとエラーになる
   # require = そのモデルに基づいた値を返すため

    def post_params
        params.require(:post).permit(:title, :body, :post_image)
    end


     def authenticate_current_end_user
        @post = Post.find(params[:id])
        if @post.user_id != current_end_user
         redirect_to public_posts_path
      end
    end

    # def enduser_params
    #   params.require(:enduser).permit(:name, :introduction, :profile_image)
    # end

 end