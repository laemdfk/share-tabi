class Admin::PostCommentsController < ApplicationController
  
  # コメントは一覧機能から削除できるようにする(postと異なり、写真の投稿がないため)
  def index
  # @comments = Comment.all.page(params[:page]).per(10)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to aadmin_post_post_comments_path,notice: "コメントを削除しました"
  end
end
