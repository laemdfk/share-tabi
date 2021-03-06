class Admin::PostCommentsController < ApplicationController
  
  def index
   @comments = PostComment.all.page(params[:page]).per(10)
  end
  
  def show
    @comment = PostComment.find(params[:id])
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_comments_path,notice: "コメントを削除しました"
  end
end
