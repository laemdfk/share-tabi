class Public::EndusersController < ApplicationController

  def mypage
    @enduser = current_end_user
  end

  def show
    # if文で条件分岐させる
    if params[:id] == nil
     @enduser = current_end_user
    else
     @enduser = EndUser.find(params[:id])
    end

    @posts = @enduser.posts.page(params[:page]).per(5)

     #↑自分が投稿したものだけを表示させるための制御文。アソシエーションで定義。
  end


  def favorites
    @enduser = EndUser.find(params[:id])
    favorites = Favorite.where(end_user_id: @enduser.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def index
    @endusers = EndUser.all
    @enduser = current_end_user
    @posts = Post.all.page(params[:page]).per(10)
  end


  def edit
    if EndUser.guest == current_end_user
      redirect_to public_root_path, notice: "ゲストユーザは編集できません。"
      return
    end
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
    if EndUser.guest == current_end_user
      redirect_to public_root_path, notice: "ゲストユーザは退会できません。"
      return
    end
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