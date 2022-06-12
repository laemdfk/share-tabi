Rails.application.routes.draw do
  
  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
    root to: 'endusers#index'

    resources :endusers, only:[:show, :edit, :update, :destroy]
    
    resources :posts, only:[:index, :show, :destroy] 
    resources :post_comments, only: [:index, :show, :destroy]
   
  end

    root to: 'public/homes#top'


  namespace :public do


    root to: 'endusers#show'

    resources :endusers, only: [:index, :show, :edit, :update, :destroy]
    
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    

  # 退会確認用ルーティング
   get 'endusers/:id/quit' => 'endusers#quit', as: 'quit'
   
   # 論理削除用のルーティング
   patch 'endusers/:id/withdrawal' => 'endusers#withdrawal', as: 'withdrawal'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
