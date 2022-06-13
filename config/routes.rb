Rails.application.routes.draw do

  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


# 一致するルートがないとエラー。ここではない。devise_scopeを外したが解決せず
  # devise_scope :enduser do
  #   post 'endusers/guest_sign_in', to: 'endusers/sessions#guest_sign_in'
  # end


  namespace :admin do
    root to: 'endusers#index'

    resources :endusers, only:[:show, :edit, :update, :destroy]

    resources :posts, only:[:index, :show, :destroy]
    resources :post_comments, only: [:index, :show, :destroy]

  end

    root to: 'public/homes#top'


  namespace :public do

    root to: 'endusers#mypage'

  # 通りはしたが、Routing Error uninitialized constant Public::Endusers Did you mean? EndUser endusersで設定しているはず…。→postだから？post=(新規データを)登録する
  devise_scope :enduser do
    post 'enduser/guest_sign_in', to: 'enduser/sessions#guest_sign_in'
  end

    resources :endusers, only: [:index, :show, :edit, :update, :destroy]

    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end

    # post 'endusers/guest_sign_in', to: 'endusers/sessions#guest_sign_in'


  # 退会確認用ルーティング
   get 'endusers/:id/quit' => 'endusers#quit', as: 'quit'

   # 論理削除用のルーティング
   patch 'endusers/:id/withdrawal' => 'endusers#withdrawal', as: 'withdrawal'
  end

end
