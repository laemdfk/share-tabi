class Public::EndusersController < ApplicationController

  def show
    @enduser = current_end_user
    @posts = @enduser.posts
     #↑自分が投稿したものだけを表示させるための制御文。
     #アソシエーションで定義させている
  end

  def index
    @endusers = EndUser.all
    @enduser = current_end_user
    @posts = Post.all
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
      flash[:notice]="ユーザー編集が完了しました."
      redirect_to public_enduser_path(current_end_user)
    else
      flash[:alate]="ニックネームを入力してください"
      render :edit
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
    flash[:notice] = "退会処理を実行いたしました。ご利用いただき、誠にありがとうございました"
    redirect_to root_path
  end


  private

  def end_user_params
    params.require(:end_user).permit(:nickname, :introduction, :profile_image)
  end

end