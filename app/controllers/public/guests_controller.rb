class Public::GuestsController < ApplicationController

  # ゲストログイン用の設定
  def new_guest
   enduser = EndUser.find_or_create_by!(email: 'guest@example.com') do |enduser|   # find_or_create_by =条件を指定して初めの1件を取得し1件もなければ作成する
     enduser.nickname = guest
     enduser.password = SecureRandom.urlsafe_base64
   end

   sign_in enduser
   redirect_to public_root_path, notice: 'ゲストユーザーとしてログインしました。'
 end
end
