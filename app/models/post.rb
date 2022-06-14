class Post < ApplicationRecord

# アソシエーション

  belongs_to :end_user
  
  has_many :post_comments,dependent: :destroy


 # 複数投稿ができるようにしたいので、has_one(一つ)ではなく、has_many(たくさんある)で実装
  has_many_attached :post_images


# バリデーション設定、タイトルと本文にのみ設定(文字だけで投稿したいユーザーも使用できるように)
  validates :title, presence: true
  validates :body, presence: true
  
  
 # 検索方法の分岐
  def self.looks(search, word)
   if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}") # 完全一致
   elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")  #前方一致
   elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}") #後方一致
   elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%") #部分一致
   else
      @post = Post.all
   end
  end


end
