class PostComment < ApplicationRecord

  # アソシエーション
  belongs_to :end_user
  belongs_to :post

  # バリデーション
  validates :comment,presence: true
end
