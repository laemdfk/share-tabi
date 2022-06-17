class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :post
  
  # validates_uniqueness_ofによるバリデーション、post_idとuser_id　の組が1組しかないように設定
  validates_uniqueness_of :post_id, scope: :end_user_id
end
