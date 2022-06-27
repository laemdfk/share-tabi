class Post < ApplicationRecord

# アソシエーション

  belongs_to :end_user

  has_many :post_comments,dependent: :destroy

  has_many :post_tags,dependent: :destroy

  has_many :tags,through: :post_tags      # through＝多対多のアソシエーションを行う際の宣言

  has_many :favorites,dependent: :destroy

  # いいねをend_userが行っているかを確認するメソッド。いいね「される」側に記述する必要がある
  def favorited_by?(end_user)
  favorites.where(end_user_id: end_user.id).exists?
  end


 # 複数投稿ができるようにしたいので、has_one(一つ)ではなく、has_many(たくさんある)で実装
  has_many_attached :post_images


# バリデーション設定、タイトルと本文にのみ設定(文字だけで投稿したいユーザーも使用できるように)
  validates :title, presence: true
  validates :body, presence: true,length: { maximum: 500 }


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


# タグの保存
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?     # 「タグが存在しているならば、タグの名前を配列として全て取得する」(unlessでタグが存在しているかを検証させる)

    old_tags = current_tags - sent_tags     # 古いタグの定義。「現在取得しているタグー送信されてきたタグ」
    new_tags = sent_tags - current_tags     # 新しいタグの定義。「送信されてきたタグー『現在存在している』タグ」　定義が少し異なるので要注意

    # 古いタグを消す
    old_tags.each do |old|
     self.tags.find_by(name: old).delete
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      binding.pry
      self.tags << new_post_tag
    end

#   元々の記述(修正前)
#   # 古いタグを消す
#     old_tags.each do |old|
#      self.tags.delete Tag.find_by(name: old)
#     end

#     # 新しいタグを保存
#     new_tags.each do |new|
#      new_post_tag = Tag.find_or_create_by(name: new)
#      self.tags << new_post_tag
#   end
  end

  # 地図へのピン設定(Geocoding)
  geocoded_by :address
  after_validation :geocode, if: :address_changed?   # latitude(緯度),longitude(経度)の自動登録設定
end
