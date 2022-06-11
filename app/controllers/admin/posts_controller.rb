class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def show
     @post = Post.find(params[:id])
     @enduser = @post.end_user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
