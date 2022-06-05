class Admin::EnduserController < ApplicationController
  def index
    @endusers = Endusers.all
  end
  
  def show
    @enduser = Enduser.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
  end
  
end
