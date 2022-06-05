Rails.application.routes.draw do
  devise_for :endusers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: "endusers#index"
  resources :endusers, only: [:index, :show, :edit, :update, :destroy]
  resources :posts, only: [:index, :show, :destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
