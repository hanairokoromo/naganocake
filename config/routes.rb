Rails.application.routes.draw do
  root to: "public/homes#top"
  
  namespace :public do
    root to: "homes#top"
    get 'homes/about'
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  end
  
  namespace :admin do
    root to: "admin/homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
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
