class Tag < ApplicationRecord
# アソシエーション
  has_many :post_tags, dependent: :destroy,foreign_key: "tag_id"
  has_many :posts, through: :post_tags
  # has_many:(モデル名),through＝多対多で、別のモデルと関連する(中間テーブルを介して、多対多を直接参照できるようにする)

  # foreign_key＝belongs_toで参照する参照先の外部キーを指定するために、belongs_toを行う側に記述する必要のあるコード

# バリデーション
  validates :name, uniqueness: true, presence: true
end
