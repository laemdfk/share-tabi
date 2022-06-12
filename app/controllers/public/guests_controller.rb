class Public::GuestsController < ApplicationController
  
  
  
    def check_guest
      if resource.email == 'guest@example.com'
        redirect_to public_root_path,alart: 'ゲストユーザーは削除できません'
      end
    end
    

end



