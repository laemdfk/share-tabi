class Public::EndusersController < ApplicationController

  def show
    # @enduser = current_end_userとしていたため、現在のユーザーのマイページが出力される→下記に修正
    @enduser = EndUser.find(params[:id])
    @posts = @enduser.posts.page(params[:page]).per(5)
     #↑自分が投稿したものだけを表示させるための制御文。
     #アソシエーションで定義させている
  end


  def index
    @endusers = EndUser.all
    @enduser = current_end_user
    @posts = Post.all.page(params[:page]).per(10)
  end


  def edit
    @enduser = EndUser.find(params[:id])
    if @enduser == current_end_user
      render "edit"
    else
      redirect_to public_enduser_path(current_end_user.id)
    end
  end

  def update
    @enduser = EndUser.find(params[:id])
    if @enduser.update(end_user_params)
      redirect_to public_enduser_path(current_end_user),notice: "ユーザー編集が完了しました."
    else
      render :edit,alate: "ニックネームを入力してください"
    end
  end


  def quit
    @enduser = current_end_user
  end


  def withdrawal
    @enduser = current_end_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @enduser.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理を実行いたしました。ご利用いただき、誠にありがとうございました"
  end


  private

  def end_user_params
    params.require(:end_user).permit(:nickname, :introduction, :profile_image)
  end

end