class Public::PostCommentsController < ApplicationController
  def create
     if EndUser.guest == current_end_user
      redirect_to mypage_path, notice: "ゲストユーザはコメントできません。"
      return    # returnとは定義したメソッドの中の戻り値を返す。この場合は、メソッドから強制的に離脱させる(ゲストユーザーでは下記end以下の処理を強制停止させたいため)
     end

  # postを1つ見つけ、コメントを作成し、コメントを保存したら遷移元のURLにリダイレクトする→コメントしたページに遷移させる
    post = Post.find(params[:post_id])
    comment = current_end_user.post_comments.new(comment_params)
    comment.post_id = post.id
    comment.score = Language.get_data(comment_params[:comment])   # post.scoreとなっていたことが原因。comment.scoreにしなければデータを正しい場所に保管できない
     if comment.save
      redirect_to post_path(post.id),notice: "コメントを投稿しました."
     else
      redirect_to post_path(post.id),flash: {alert: "コメントを入力してください"}
    end
  end

  def destroy
    comment = PostComment.find(params[:post_id])
    comment.destroy
    redirect_to posts_path,notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:post_comment).permit(:comment, :post_id)
  end
end
