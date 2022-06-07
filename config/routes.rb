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
   
    get 'endusers/index'
    get 'endusers/show'
    get 'endusers/edit'

    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
