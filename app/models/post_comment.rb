class PostComment < ApplicationRecord

  # アソシエーション
  belongs_to :enduser
  belongs_to :post

  # バリデーション
  validates :comment,presence: true
end
