class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!   # deviseメソッド。「ユーザーがログイン状態か確認し、未ログインならログインページにリダイレクトさせる

  def search
    @model = params[:model]      #検索モデルの定義
    @content = params[:content]  #検索内容の定義
    @method = params[:method]    #検索方法(メソッド)の定義

    @range = params[:range]
    
    if @range == "Post"
       @posts = Post.looks(params[:search], params[:word])
    else
      @endusers = EndUser.looks(params[:search], params[:word])
    end
  end
end
