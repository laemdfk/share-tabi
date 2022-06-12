class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
 #ゲストログインの設定 
 def new_guest
  enduser = EndUser.find_or_create_by!(email: 'guest@example.com') do |enduser|   # find_or_create_by =条件を指定して初めの1件を取得し1件もなければ作成する
  
   enduser.nickname = guest
   enduser.password = SecureRandom.urlsafe_base64     # パスワードをランダム生成させるメソッド
 end  
end


# アソシエーション
  has_many :posts, dependent: :destroy

  has_many :post_images, dependent: :destroy
  
  has_many :post_comments,dependent: :destroy
  

# Active storageの設定
  has_one_attached :profile_image
  

 # バリデーション
  validates :nickname, presence: true
  

 # 退会後に、同じアカウントでログインできないようにする処理
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  
 end
