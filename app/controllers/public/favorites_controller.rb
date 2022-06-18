class Public::FavoritesController < ApplicationController
  def create
  @post = Post.find(params[:post_id])
  favorite = current_end_user.favorites.new(post_id: @post.id)
  favorite.save
  # redirect_to public_post_path(post)
 end


 def destroy
  @post = Post.find(params[:post_id])
  favorite = current_end_user.favorites.find_by(post_id: @post.id)
  favorite.destroy   # 内容を破棄する必要があるので「destroy」。saveにしていたので発火しなかった
  # redirect_to public_post_path(post)
 end

end

