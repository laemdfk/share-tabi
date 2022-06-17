class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_end_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to public_posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_end_user.favorites.find_by(post_id: post.id)
    favorite.save
    redirect_to public_posts_path
  end
end
