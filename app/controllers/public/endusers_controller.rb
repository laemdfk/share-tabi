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
    # @new_post = Book.new
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
      flash[:notice]="You have updated user successfully."
      redirect_to public_enduser_path(current_end_user)
    else
      render :edit
    end
  end


  private

  def end_user_params
    params.require(:end_user).permit(:nickname, :introduction, :profile_image)
  end
end