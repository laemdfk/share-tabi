class Public::PostsController < ApplicationController

  before_action :current_user, {only: [:edit, :update, :destroy]}

  def new
    @new_post = Post.new
  end


  def create
    @enduser = current_end_user
		@new_post = Post.new(post_params)

    @new_post.enduser_id = current_end_user.id
    #↑ ユーザーと投稿を紐づけるためのコード

	   if @new_post.save
        flash[:notice] = "You have creatad book successfully."
		    redirect_to  public_post(@new_post.id)
     else
        render "new"
     end
  end

  def index
    @enduser = current_end_user
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @enduser = @post.user
  end

  def edit
    @post = Post.find(params[:id])

    if @post.user == current_end_user
         render "edit"
    else
        redirect_to posts_path
    end
  end


 def update
   @post = Post.find(params[:id])
    if @post.update(post_params)

      flash[:notice]="You have updated successfully."
      redirect_to post_path(@post.id)

    else
        render "edit"
    end
end


    def destroy
      post = post.find(params[:id])
      post.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to posts_path
    end


	private

    def post_params
        params.require(:post).permit(:title, :body)
    end

     def authenticate_current_end_user
        @post = Post.find(params[:id])
        if @post.user_id != current_end_user
         redirect_to posts_path
      end
    end

    # def user_params
    #   params.require(:enduser).permit(:name, :introduction, :profile_image)
    # end

 end