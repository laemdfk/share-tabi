# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 
  # before_action :configure_sign_in_params, only: [:create]
  
  # deviseのデフォルトコードでないと、読み込むことができない=遷移を制御できない
 def after_sign_in_path_for(resource)
   public_root_path(resource)
 end

  
  protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_user
    @enduser = EndUser.find_by(name: params[:enduser][:email])
    if @enduser 
      if @enduser.valid_password?(params[:enduser][:password]) && (@enduser.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

end