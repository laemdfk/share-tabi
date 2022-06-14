class Admin::SearchesController < ApplicationController
  def search
    @model = params[:model]      #検索モデルの定義
    @content = params[:content]  #検索内容の定義
    @method = params[:method]    #検索方法(メソッド)の定義

    @range = params[:range]

    if @range == "Post"
       @posts = Post.looks(params[:search], params[:word])   # looks=searchesとwordsの引数を受け取る(モデルで)
    elsif
      @endusers = EndUser.looks(params[:search], params[:word])
    else
      @comment = PostComment.looks(params[:search], params[:word])
    end
  end
end