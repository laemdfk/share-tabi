class Public::PostsController < ApplicationController

  before_action :current_end_user, {only: [:edit, :update, :destroy]}

  def new
      if EndUser.guest == current_end_user
       redirect_to public_root_path, notice: "ゲストユーザは新規投稿できません。"
      return
     end
    @post_new = Post.new
    # ここにparamsをつけてしまうと、createの値と重複してデータが渡ってしまう
  end


  def create

    # @enduser = current_end_user
	 @post_new = Post.new(post_params)
     @post_new.end_user_id = current_end_user.id
    #↑ ユーザーと投稿を紐づけるためのコード

    # タグの保存用コード。受け取った値を「,」で区切り、配列とする
    tag_list = params[:post][:name].split(',')

	 if @post_new.save
	     @post_new.save_tag(tag_list)

		 redirect_to public_post_path(@post_new.id), notice:  "投稿の保存に成功しました"
   else
    flash.now[:alert] = "空欄があるか、入力制限がかかっています。下記のエラー内容を確認してください(写真,タグ,場所の投稿は任意です)"
      render "new"
   end
  end


  def index
    @enduser = current_end_user
    @posts = Post.all.page(params[:page]).per(10)
    @tag_list =Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @enduser = @post.end_user
    @post_comment = PostComment.new
    @post_tags = @post.tags
  end

def search_tag
    @tag = Tag.find(params[:tag_id])
#検索されたタグに紐づく投稿を表示
   @posts = @tag.posts.page(params[:page]).per(10)
  end


  def edit
    @post = Post.find(params[:id])
    @tag_list= @post.tags.pluck(:name).join(',')

    if @post.end_user == current_end_user
         render "edit"
    else
        redirect_to posts_path
    end
  end


 def update
   @post = Post.find(params[:id])
   tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
        # このpost_idに紐づいていたタグを@oldに入れる
        @old_relations = PostTag.where(post_id: @post.id)
        # それらを取り出し、消去する。
        @old_relations.each do |relation|
        relation.delete
        end
        # 古いタグの消去後、再度保存を行う。
      @post.save_tag(tag_list)
      redirect_to public_post_path(@post.id),notice: "投稿の編集が完了しました"
    else
        flash.now[:alert] = "空欄があるか、入力制限がかかっています。下記のエラー内容を確認してください(写真,タグ,場所の投稿は任意です)"
        render "edit"
    end
 end


    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to public_enduser_path(current_end_user),notice: "投稿の削除に成功しました"
    end


	private

   # params.require(:モデル名).permit(カラム名)の形で記入しないとエラーになる
   # require = そのモデルに基づいた値を返すため

    def post_params
        params.require(:post).permit(:title, :body,:address, post_images: [])
    end


     def authenticate_current_end_user
        @post = Post.find(params[:id])
        if @post.user_id != current_end_user
         redirect_to public_posts_path
        end
     end

#   def post_comment_params
#     params.require(:post_comment).permit(:comment,:post_id)
#   end


 end