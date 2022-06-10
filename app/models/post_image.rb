class PostImage < ApplicationRecord
  
  belongs_to :user
  
   # 複数投稿ができるようにしたいので、has_one(一つ)ではなく、has_many(たくさんある)で実装
  has_many_attached :post_image
  
end
