class ApplicationController < ActionController::Base

# ↓を設定すると、admin側でログインできなくなるためコメントアウト
# before_action :authenticate_end_user!, except: [:top]


before_action :configure_permitted_parameters, if: :devise_controller?

# deviseのデフォルトコードでないと、読み込むことができない=遷移を制御できない
def after_sign_in_path_for(resource)
    public_root_path
end


protected

# #config側で「email認証」の設定をしたため、ここでニックネームを許可
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up,keys:[:nickname])
end


# 元々の制御部分。pry-railsでcheckしたところ、コードが発火していなかった。
#   def after_end_user_sign_in_path_for(resource)
#     public_root_path(resource)
# end

end
