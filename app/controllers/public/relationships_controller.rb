class Public::RelationshipsController < ApplicationController

def create
  current_end_user.follow(params[:end_user_id])
  redirect_to request.referer
end

def destroy
  current_end_user.unfollow(params[:end_user_id])
  redirect_to request.referer
end

def follows
  enduser = EndUser.find(params[:id])
  @endusers = end_user.following_end_user.page(params[:page]).per(3).reverse_order
end

def followers
  enduser = EndUser.find(params[:id])
  @endusers = end_user.follower_end_user.page(params[:page]).per(3).reverse_order
end


end