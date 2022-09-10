Rails.application.routes.draw do
  root to: "public/homes#top"
  namespace :public do
    root to: "homes#top"
    get 'homes/about'
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
