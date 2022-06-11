class Post < ApplicationRecord


  belongs_to :end_user

  # 複数投稿ができるようにしたいので、has_one(一つ)ではなく、has_many(たくさんある)で実装
  has_many_attached :post_images


  # バリデーション設定、タイトルと本文にのみ設定(文字だけで投稿したいユーザーも使用できるように)
  validates :title, presence: true
  validates :body, presence: true

end
