Rails.application.routes.draw do
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
    get 'posts/destroy'
  end
  namespace :admin do
    get 'endusers/index'
    get 'endusers/show'
    get 'endusers/edit'
    get 'endusers/update'
    get 'endusers/destroy'
  end
  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
