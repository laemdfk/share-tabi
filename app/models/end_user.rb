class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          has_many :posts, dependent: :destroy

          has_many :post_images, dependent: :destroy

          has_one_attached :profile_image

          has_many_attached :post_images

          validates :nickname, presence: true

          # 退会後に、同じアカウントでログインできないようにする処理
          def active_for_authentication?
           super && (is_deleted == false)
          end
end
