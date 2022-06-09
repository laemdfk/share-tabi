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
  end
  
    root to: 'public/homes#top'
  
  
  namespace :public do
    
    root to: 'public/endusers#show'
   
    resources :endusers, only: [:index, :show, :edit, :update, :destroy]
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
