Rails.application.routes.draw do

  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  # sessions: 'public/guest_sign_in'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


# 一致するルートがないとエラー→→URL、ルーティングの問題だった。
  devise_scope :end_user do
    post 'endusers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  namespace :admin do
    root to: 'endusers#index'

    resources :endusers, only:[:show, :edit, :update, :destroy]

    resources :posts, only:[:index, :show, :destroy]
    resources :post_comments, only: [:index, :show, :destroy]

     # 検索機能ルーティング
     get "search" => "searches#search"

  end


  #共通トップ画面のルートパス
    root to: 'public/homes#top'
    get "about"=>"public/homes#about"



   namespace :public do
  # scope module: :public do

    root to: 'endusers#mypage'

    resources :endusers, only: [:index, :show, :edit, :update, :destroy] do
      member do
       get :favorites
      end
    end


    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites,only:[:create, :destroy]
    end




  # 検索機能ルーティング
  get "search" => "searches#search"

  # タグ検索機能用ルーティング
   get "search_tag"=>"posts#search_tag"

  # 退会確認用ルーティング
   get 'endusers/:id/quit' => 'endusers#quit', as: 'quit'

   # 論理削除用のルーティング
   patch 'endusers/:id/withdrawal' => 'endusers#withdrawal', as: 'withdrawal'
  end

end
