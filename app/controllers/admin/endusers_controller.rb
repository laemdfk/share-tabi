class Admin::EndusersController < ApplicationController

  def index
    @endusers = EndUser.all.page(params[:page]).per(10)
  end

  def show
     @enduser = EndUser.find(params[:id])
  end

  def edit
    @enduser = EndUser.find(params[:id])
  end

  def update
    @enduser = EndUser.find(params[:id])
    if @enduser.update(enduser_params)
      redirect_to admin_enduser_path(@enduser.id)
    else
      render "edit"
    end
  end

  def destroy
  end

  def enduser_params
     params.require(:end_user).permit(:nickname, :email, :is_deleted)
  end
end
