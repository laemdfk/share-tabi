class ApplicationController < ActionController::Base
  
# 設定すると、admin側でログインできなくなるためコメントアウト

# before_action :authenticate_end_user!, except: [:top]
# before_action :configure_permitted_parameters, if: :devise_controller?


#   protected

# #config側で「名前認証」の設定をしたため、ここでemailを許可
# def configure_permitted_parameters
#   devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
# end
end
