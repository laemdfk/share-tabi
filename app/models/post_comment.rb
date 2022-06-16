class PostComment < ApplicationRecord

  # アソシエーション
  belongs_to :end_user
  belongs_to :post

  # バリデーション
  validates :comment,presence: true
  
  # 検索方法の分岐(admin用)
  def self.looks(search, word)
   if search == "perfect_match"
      @comment = PostComment.where("comment LIKE?", "#{word}") # 完全一致
   elsif search == "forward_match"
      @comment = PostComment.where("comment LIKE?","#{word}%")  #前方一致
   elsif search == "backward_match"
      @comment = PostComment.where("comment LIKE?","%#{word}") #後方一致
   elsif search == "partial_match"
      @comment = PostComment.where("comment LIKE?","%#{word}%") #部分一致
   else
      @comment = PostComment.all
   end
  end
end
