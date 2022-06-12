class Public::PostCommentsController < ApplicationController
  def create
    post = post.find(params[:post_id])
    comment = current_enduser.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer  # 特定の処理後(今回はsave)、遷移元のURLにリダイレクトさせる
  end

  def destroy
    comment.find(params[:id])
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
