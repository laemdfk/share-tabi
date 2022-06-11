class PostImage < ApplicationRecord
  
  belongs_to :end_user
  
   # 複数投稿ができるようにしたいので、has_one(一つ)ではなく、has_many(たくさんある)で実装
  
end
