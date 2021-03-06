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

def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = "guest"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
end



# アソシエーション
  has_many :posts, dependent: :destroy

  has_many :post_comments,dependent: :destroy

  has_many :favorites,dependent: :destroy


# Active storageの設定
  has_one_attached :profile_image


 # バリデーション
  validates :nickname, presence: true,length: { maximum: 15 }


 # 退会後に、同じアカウントでログインできないようにする処理
  def active_for_authentication?
    super && (is_deleted == false)
  end


# 検索方法の分岐
def self.looks(search, word)
   if search == "perfect_match"
      @enduser = EndUser.where("nickname LIKE?", "#{word}") # 完全一致
   elsif search == "forward_match"
      @enduser = EndUser.where("nickname LIKE?","#{word}%")  #前方一致
   elsif search == "backward_match"
      @enduser = EndUser.where("nickname LIKE?","%#{word}") #後方一致
   elsif search == "partial_match"
      @enduser = EndUser.where("nickname LIKE?","%#{word}%") #部分一致
   else
      @enduser = EndUser.all
   end
end

end