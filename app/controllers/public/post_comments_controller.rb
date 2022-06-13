class Public::PostCommentsController < ApplicationController
  def create
  # postを1つ見つけ、コメントを作成し、コメントを保存したら遷移元のURLにリダイレクトする
    post = Post.find(params[:post_id])
    comment = current_end_user.post_comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer,notice: "コメントを投稿しました."  # 特定の処理後(今回はsave)、遷移元のURLにリダイレクトさせる
  end

  def destroy

    comment = PostComment.find(params[:post_id])
    comment.destroy
    redirect_to request.referer
  end

  private

  # def post_comment_params
  #   params.require(:post_comment).permit(:comment, :post_id)
  # end

  def comment_params
    params.require(:post_comment).permit(:comment, :post_id)
    # .merge(user_id: current_user.id, question_id: params[:question_id])
  end

end
