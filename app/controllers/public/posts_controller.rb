class Public::PostsController < ApplicationController
  
  before_action :current_user, {only: [:edit, :update, :destroy]}
  
  def new
    @new_post = Post.new
  end
  
  
  def create
    @enduser = current_user
		@new_post = Post.new(post_params)

    @new_post.enduser_id = current_user.id
    #↑ ユーザーと投稿を紐づけるためのコード

	   if @new_post.save
        flash[:notice] = "You have creatad book successfully."
		    redirect_to  post_path(@new_post.id)
     else
        render "new"
     end
  end
  
  def index
    @enduser = current_user
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @enduser = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
         render "edit"
    else
        redirect_to posts_path
    end
  end
  
end
