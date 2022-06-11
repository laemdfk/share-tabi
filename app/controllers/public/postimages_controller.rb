class Public::PostimagesController < ApplicationController
  
  def new
    @new_post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def show
  end

  def index
  end
  
   def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
